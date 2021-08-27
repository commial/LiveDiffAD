# Inspiration: github.com/AlsidOfficial/UncoverDCShadow

## Module variables
# Cache for the root DSE Ldap object
$g_rootDSE = $null
# Current highest LocalUSN
$global:g_curUSN = $null
# Temporary highest LocalUSN
$global:g_tmpUSN = $null

## Load necessary assemblies
$null = [System.Reflection.Assembly]::LoadWithPartialName("System.DirectoryServices.Protocols")
$null = [System.Reflection.Assembly]::LoadWithPartialName("System.Net")

# Useful type for printing
Add-Type @'
using System;
[Flags]
public enum SamAccountType
{
    SAM_DOMAIN_OBJECT = 0x00000000,
    SAM_GROUP_OBJECT = 0x10000000,
    SAM_NON_SECURITY_GROUP_OBJECT = 0x10000001,
    SAM_ALIAS_OBJECT = 0x20000000,
    SAM_NON_SECURITY_ALIAS_OBJECT = 0x20000001,
    SAM_USER_OBJECT = 0x30000000,
    SAM_MACHINE_ACCOUNT = 0x30000001,
    SAM_TRUST_ACCOUNT = 0x30000002,
    SAM_APP_BASIC_GROUP = 0x40000000,
    SAM_APP_QUERY_GROUP = 0x40000001
}
'@

Add-Type @'
using System;
[Flags]
public enum UserAccountControl : uint
{
    UF_SCRIPT = 0x1,
    UF_ACCOUNTDISABLE = 0x2,
    UF_HOMEDIR_REQUIRED = 0x8,
    UF_LOCKOUT = 0x10,
    UF_PASSWD_NOTREQD = 0x20,
    UF_PASSWD_CANT_CHANGE = 0x40,
    UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED = 0x80,
    UF_TEMP_DUPLICATE_ACCOUNT = 0x100,
    UF_NORMAL_ACCOUNT = 0x200,
    UF_INTERDOMAIN_TRUST_ACCOUNT = 0x800,
    UF_WORKSTATION_TRUST_ACCOUNT = 0x1000,
    UF_SERVER_TRUST_ACCOUNT = 0x2000,
    UF_DONT_EXPIRE_PASSWD = 0x10000,
    UF_MNS_LOGON_ACCOUNT = 0x20000,
    UF_SMARTCARD_REQUIRED = 0x40000,
    UF_TRUSTED_FOR_DELEGATION = 0x80000,
    UF_NOT_DELEGATED = 0x100000,
    UF_USE_DES_KEY_ONLY = 0x200000,
    UF_DONT_REQUIRE_PREAUTH = 0x400000,
    UF_PASSWORD_EXPIRED = 0x800000,
    UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 0x1000000,
    UF_NO_AUTH_DATA_REQUIRED = 0x2000000,
    UF_PARTIAL_SECRETS_ACCOUNT = 0x4000000,
    UF_USE_AES_KEYS = 0x8000000
}
'@

Add-Type @'
using System;
[Flags]
public enum EncryptionTypes
{
    DES_CBC_CRC = 0x1,
    DES_CBC_MD5 = 0x2,
    RC4_HMAC_MD5 = 0x4,
    AES128_CTS_HMAC_SHA1_96 = 0x8,
    AES256_CTS_HMAC_SHA1_96 = 0x10
}
'@

Function New-AsyncCallback {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [ScriptBlock] $Callback,

        [Parameter(Mandatory = $true)]
        [PSCustomObject] $Infos
    ) 
    
    Write-Debug "[$(Get-Date)][New-AsyncCallback] Begin"

    If (-not ("AsyncCallbackForPS" -as [type])) {
        Add-Type @"
            using System;
             
            public sealed class AsyncCallbackForPS
            {
                public event AsyncCallback CallbackComplete = delegate { };
                public Object CallbackArgs;
 
                public AsyncCallbackForPS() {}
 
                private void CallbackInternal(IAsyncResult result)
                {
                    CallbackComplete(result);
                }
 
                public AsyncCallback Callback
                {
                    get { return new AsyncCallback(CallbackInternal); }
                }
            }
"@
    }
    $AsyncCB = New-Object AsyncCallbackForPS
    $AsyncCB.CallbackArgs = $Infos
    $null = Register-ObjectEvent -InputObject $AsyncCB -EventName CallbackComplete -Action $Callback
    $AsyncCB.Callback

    Write-Debug "[$(Get-Date)][New-AsyncCallback] End"
}

Function Write-Entry
{
    param(
        [Parameter(Mandatory = $true)]
        [System.DirectoryServices.Protocols.SearchResultEntry] $Entry
    )

    Write-Debug "[$(Get-Date)][Write-Entry] Begin"

    $name = ($Entry.DistinguishedName | out-string)
    Write-Host "[$(Get-Date)] $name"
    ForEach ($attrName in $Entry.Attributes.AttributeNames) {
        Switch ($attrName) {
            { $_ -in "objectguid", "invocationid" } {
                $item = (New-Object Guid $Entry.Attributes[$attrName].GetValues([byte[]])).Guid
                Write-Debug "`t$($attrName): $item"
            }
            "objectsid" {
                $item = (New-Object System.Security.Principal.SecurityIdentifier $Entry.Attributes[$attrName].GetValues([byte[]])[0], 0).Value
                Write-Debug "`t$($attrName): $item"
            }
            default {
                ForEach ($item in $Entry.Attributes[$attrName].GetValues([string])) {
                    Write-Debug "`t$($attrName): $item"
                }
            }
        }
    }

    Write-Debug "[$(Get-Date)][Write-Entry] End"
}

Function Write-Attribute
{
    param(
        [Parameter(Mandatory = $true)]
        [Microsoft.ActiveDirectory.Management.ADReplicationAttributeMetadata] $Info
    )
    $attrName = $Info.AttributeName
    $attrValue = $Info.AttributeValue
    try {
    Switch ($attrName) {
            { $_ -in "objectguid", "invocationid" } {
                $item = (New-Object Guid $attrValue)
                Write-Host "`t$($attrName): $item"
            }
            "objectsid" {
                $item = (New-Object System.Security.Principal.SecurityIdentifier $attrValue)
                Write-Host "`t$($attrName): $item"
            }
            "sAMAccountType" {
                $item = ([SamAccountType]$attrValue)
                Write-Host "`t$($attrName): $item"
            }
            "userAccountControl" {
                $item = ([UserAccountControl]$attrValue)
                Write-Host "`t$($attrName): $item"
            }
            "nTSecurityDescriptor" {
                $item = ([System.DirectoryServices.ActiveDirectorySecurity]$attrValue).Sddl
                Write-Host "`t$($attrName): $item"                
            }
            "msDS-SupportedEncryptionTypes" {
                $item = ([EncryptionTypes]$attrValue)
                Write-Host "`t$($attrName): $item"
            }
            default {
                Write-Host "`t$($attrName): $attrValue"
            }
        }
    } Catch {
        Write-Host $_
        Write-Host "`t$($attrName): $attrValue"
    }
}

Function Update-ADChanges
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCustomObject] $Infos,

        [Parameter(Mandatory = $true)]
        [System.DirectoryServices.Protocols.SearchResultEntry] $Entry
    )

    Write-Debug "[$(Get-Date)][Update-ADChanges] Begin"
    Write-Entry $Entry

    Try {
        $dn = $Entry.DistinguishedName
        $repl_data = Get-ADReplicationAttributeMetadata -Object $dn -Server $Infos.Server -IncludeDeletedObject -ShowAllLinkedValues
        $new_USN = $global:g_curUSN
        ForEach ($repl in $repl_data) {
            #Write-Debug ($repl | Format-List | Out-String)
            If ($repl.LocalChangeUsn -gt $global:g_curUSN) {
                Write-Attribute $repl
                If ($repl.LocalChangeUsn -gt $new_USN) {
                    $new_USN = $repl.LocalChangeUsn
                }
            }
        }
        If ($new_USN -gt $global:g_curUSN) {
            $global:g_tmpUSN = $new_USN
        }
    } Catch {
        Write-Host $_
    }

    Write-Debug "[$(Get-Date)][Update-ADChanges] End"
}

Function Invoke-NotifyCallback
{
    param([System.IAsyncResult] $result)

    Write-Debug "[$(Get-Date)][Invoke-NotifyCallback] Begin"
    Try {
        # Re-import the module in this runspace
        Import-Module (Join-Path -Path $PSScriptRoot -ChildPath 'livediff.ps1') -WarningAction SilentlyContinue -Verbose:$false

        $Infos = $Sender.CallbackArgs

        $prc = $Infos.LdapConnection.GetPartialResults($result)

        ForEach ($entry in $prc) {
            Update-ADChanges $Infos $entry
        }
        $global:g_curUSN = $global:g_tmpUSN
        Write-Debug "[Cur-USN] $global:g_curUSN"
    } Catch {
        Write-Host $_
    }

    Write-Debug "[$(Get-Date)][Invoke-NotifyCallback] End"
}

Function Register-LdapSearch
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCustomObject] $Infos,
        [Parameter(Mandatory = $true)]
        [string] $SearchDn,
        [Parameter(Mandatory = $true)]
        [System.DirectoryServices.Protocols.SearchScope] $Scope
    )

    Write-Debug "[$(Get-Date)][Register-LdapSearch] Begin"

    $Ldap = $Infos.LdapConnection

    [System.DirectoryServices.Protocols.SearchRequest] $request = New-Object System.DirectoryServices.Protocols.SearchRequest -ArgumentList @(
        $SearchDn, # root the search here
        "(objectClass=*)", # very inclusive
        $Scope, # any scope works
        $null # we are interested in all attributes
    )

    $null = $request.Controls.Add((New-Object System.DirectoryServices.Protocols.DirectoryNotificationControl))

    [System.IAsyncResult] $result = $Ldap.BeginSendRequest(
        $request,
        (New-TimeSpan -Days 1),
        [System.DirectoryServices.Protocols.PartialResultProcessing]::ReturnPartialResultsAndNotifyCallback,
        (New-AsyncCallback ${function:Invoke-NotifyCallback} $Infos),
        $request
    )

    Write-Debug "[$(Get-Date)][Register-LdapSearch] End"

    return $result
}

Function Dispose-LdapSearches
{
    param(
        [Parameter(Mandatory = $true)]
        [System.DirectoryServices.Protocols.LdapConnection] $Ldap,
        [Parameter(Mandatory = $true)]
        [System.IAsyncResult[]] $SearchResults
    )

    Write-Debug "[$(Get-Date)][Dispose-LdapSearches] Begin"

    ForEach ($result in $SearchResults)
    {
        # End each async search
        Try {
            $Ldap.Abort($result)
        } Catch {
            Write-Host $_
        }
    }

    $Ldap.Dispose()

    Write-Debug "[$(Get-Date)][Dispose-LdapSearches] End"
}

Function Get-RootDse
{
    param(
        [Parameter(Mandatory = $true)]
        [System.DirectoryServices.Protocols.LdapConnection] $Ldap
    )

    Write-Debug "[$(Get-Date)][Get-RootDse] Begin"

    If ($Script:g_rootDSE) {
        return $Script:g_rootDSE
    }

    [System.DirectoryServices.Protocols.SearchRequest] $request = New-Object System.DirectoryServices.Protocols.SearchRequest -ArgumentList @(
        $null,
        "(objectClass=*)",
        [System.DirectoryServices.Protocols.SearchScope]::Base,
        $null
    )

    $LdapRootDSE = [System.DirectoryServices.Protocols.SearchResponse] $Ldap.SendRequest($request)

    $rootDSE = @{}

    ForEach ($attrName in $LdapRootDSE.entries.Attributes.AttributeNames) {
        $rootDSE[$attrName] = $LdapRootDSE.entries.Attributes[$attrName].GetValues([String])
    }

    $Script:g_rootDSE = $rootDSE

    Write-Output $rootDSE

    $global:g_curUSN = [int]$rootDSE.highestCommittedUSN[0]

    Write-Debug "[$(Get-Date)][Get-RootDse] End"
}

Function Get-DefaultNamingContext
{
    param(
        [Parameter(Mandatory = $true)]
        [System.DirectoryServices.Protocols.LdapConnection] $Ldap
    )

    Write-Debug "[$(Get-Date)][Get-DefaultNamingContext] Begin"

    $rootDSE = Get-RootDse $Ldap
    Write-Output $rootDSE.defaultnamingcontext

    Write-Debug "[$(Get-Date)][Get-DefaultNamingContext] End"
}

Function Get-ConfigurationNamingContext
{
    param(
        [Parameter(Mandatory = $true)]
        [System.DirectoryServices.Protocols.LdapConnection] $Ldap
    )

    Write-Debug "[$(Get-Date)][Get-ConfigurationNamingContext] Begin"
    
    $rootDSE = Get-RootDse $Ldap
    Write-Output $rootDSE.configurationnamingcontext

    Write-Debug "[$(Get-Date)][Get-ConfigurationNamingContext] End"
}

Function Get-SchemaNamingContext
{
    param(
        [Parameter(Mandatory = $true)]
        [System.DirectoryServices.Protocols.LdapConnection] $Ldap
    )

    Write-Debug "[$(Get-Date)][Get-SchemaNamingContext] Begin"
    
    $rootDSE = Get-RootDse $Ldap
    Write-Output $rootDSE.schemanamingcontext

    Write-Debug "[$(Get-Date)][Get-SchemaNamingContext] End"
}


Function Get-ForestDnsZones
{
    param(
        [Parameter(Mandatory = $true)]
        [System.DirectoryServices.Protocols.LdapConnection] $Ldap
    )

    Write-Debug "[$(Get-Date)][Get-ForestDnsZones] Begin"
    
    $rootDSE = Get-RootDse $Ldap
    ForEach ($NC in $rootDSE.namingcontexts) {
        # A bit hack-ish, but not in $rootDSE attributes
        If ($NC.Contains("ForestDnsZones")) {
            Write-Output $NC
        }
    }

    Write-Debug "[$(Get-Date)][Get-ForestDnsZones] End"
}

Function Get-DomainDnsZones
{
    param(
        [Parameter(Mandatory = $true)]
        [System.DirectoryServices.Protocols.LdapConnection] $Ldap
    )

    Write-Debug "[$(Get-Date)][Get-DomainDnsZones] Begin"
    
    $rootDSE = Get-RootDse $Ldap
    ForEach ($NC in $rootDSE.namingcontexts) {
        # A bit hack-ish, but not in $rootDSE attributes
        If ($NC.Contains("DomainDnsZones")) {
            Write-Output $NC
        }
    }

    Write-Debug "[$(Get-Date)][Get-DomainDnsZones] End"
}

Function New-BindedLdapConnection
{
    param(
        [Parameter(Mandatory = $true)]
        [String] $Server,

        [Parameter(Mandatory = $false)]
        [AllowNull()]
        [PSCredential] $Credential = $null
    )

    Write-Debug "[$(Get-Date)][New-BindedLdapConnection] Begin"

    $ldap = New-Object System.DirectoryServices.Protocols.LdapConnection $Server
    $ldap.SessionOptions.ProtocolVersion = 3
    $ldap.AuthType = [System.DirectoryServices.Protocols.AuthType]::Negotiate
    If ($Credential) {
        $cred = New-Object System.Net.NetworkCredential $Credential.UserName, $Credential.Password
        $ldap.Bind($cred)
    }
    $ldap.AutoBind = $true

    Write-Output $ldap

    Write-Debug "[$(Get-Date)][New-BindedLdapConnection] End"
}

Function Get-LogonDomainController
{
    Write-Debug "[$(Get-Date)][Get-CurrentDomainController] Begin"
    Write-Output "$($env:LogonServer -replace '^\\\\').$($env:UserDnsDomain)"
    Write-Debug "[$(Get-Date)][Get-CurrentDomainController] End"
}

Function Show-LiveDiff
{
    <#
.SYNOPSIS
Show AD live diff
.DESCRIPTION
TBD
.PARAMETER Server
[Optional] Server to monitor. If not given, will use the current user's logon controller.
.PARAMETER Credential
[Optional] AD account to use to connect. If not given, will implicitly use the current user's credentials.
.EXAMPLE
Show-LiveDiff

Implicitly use the current user's credentials and domain
.EXAMPLE
Show-LiveDiff -Server 192.168.1.1

Implicitly use the current user's credentials on the domain controller at 192.168.1.1
.EXAMPLE
Show-LiveDiff -Server 192.168.1.1 -Credential (Get-Credential -Message "Domain account to use")
.OUTPUTS
[PSCustomObject] TBD
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [AllowEmptyString()]
        [String] $Server = '',

        [Parameter(Mandatory = $false)]
        [AllowNull()]
        [PSCredential] $Credential = $null
    )

    Write-Debug "[$(Get-Date)][Show-LiveDiff] Begin"

    If (-not $Server) {
        $Server = Get-LogonDomainController
    }
    
    $ldapConnection = New-BindedLdapConnection $Server $Credential

    $defaultNC = Get-DefaultNamingContext $ldapConnection
    $configurationNC = Get-ConfigurationNamingContext $ldapConnection
    $schemaNC = Get-SchemaNamingContext $ldapConnection
    $forestdnsNC = Get-ForestDnsZones $ldapConnection
    $domaindnsNC = Get-DomainDnsZones $ldapConnection
    $searchScope = [System.DirectoryServices.Protocols.SearchScope]::Subtree

    $Infos = [PSCustomObject] @{
        LdapConnection = $LdapConnection
        DefaultNC = $defaultNC
        Server = $Server
    }

    $searchResults = @()
    $searchResults += Register-LdapSearch $Infos $defaultNC $searchScope
    $searchResults += Register-LdapSearch $Infos $configurationNC $searchScope
    $searchResults += Register-LdapSearch $Infos $schemaNC $searchScope
    $searchResults += Register-LdapSearch $Infos $forestdnsNC $searchScope
    $searchResults += Register-LdapSearch $Infos $domaindnsNC $searchScope

    & repadmin /showchanges $Server $defaultNC /cookie:cookie.bin > $null
    & repadmin /showchanges $Server $configurationNC /cookie:cookie-config.bin > $null
    & repadmin /showchanges $Server $schemaNC /cookie:cookie-schema.bin > $null
    & repadmin /showchanges $Server $forestdnsNC /cookie:cookie-forestdns.bin > $null
    & repadmin /showchanges $Server $domaindnsNC /cookie:cookie-domaindns.bin > $null

    Write-Information "Show-LiveDiff (type 'q' to abort, ctrl+c will discard output)..."

    $Continue = $true
    Try {
        While ($Continue) {
            Start-Sleep 1
        }
    } Catch {
        Write-Error $_
    } Finally {
        Write-Information "Terminated."
        Get-EventSubscriber | Unregister-Event
        Dispose-LdapSearches $ldapConnection $searchResults

        Write-Host "[Summary - $defaultNC]"
        repadmin /showchanges $Server $defaultNC /cookie:cookie.bin | Out-Host
        Write-Host "[Summary - $configurationNC]"
        repadmin /showchanges $Server $configurationNC /cookie:cookie-config.bin | Out-Host
        Write-Host "[Summary - $schemaNC]"
        repadmin /showchanges $Server $schemaNC /cookie:cookie-schema.bin | Out-Host
        Write-Host "[Summary - $forestdnsNC]"
        repadmin /showchanges $Server $forestdnsNC /cookie:cookie-forestdns.bin | Out-Host
        Write-Host "[Summary - $domaindnsNC]"
        repadmin /showchanges $Server $domaindnsNC /cookie:cookie-domaindns.bin | Out-Host
    }

    Write-Debug "[$(Get-Date)][Show-LiveDiff] End"
}

