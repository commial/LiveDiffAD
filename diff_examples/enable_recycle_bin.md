# Enable Recycle Bin feature

## Scenario

Enable the Recycle bin feature through `dsac.exe` (*Active Directory Administrative Center*).

## Remarks

The `msDS-EnabledFeature` is how Microsoft's `C:\Windows\System32\BestPractices\v1.0\Models\Microsoft\Windows\DirectoryServices\DirectoryServices.ps1::IsOptionalFeatureEnabled` check a feature state:
```powershell
if ($confDn) {
    $partitionsDn = "CN=Partitions," + $confDn
}

$partitionsObj = GetADObject $partitionsDn $confDn $computer ("msDS-Behavior-Version", "msDS-EnabledFeature") $errVarRef
```

## Results

```
[08/09/2021 08:21:41] CN=Partitions,CN=Configuration,DC=WINDOMAIN,DC=LOCAL

	msDS-EnabledFeature: CN=Recycle Bin Feature,CN=Optional Features,CN=Directory Service,CN=Windows NT,CN=Services,CN=Configuration,DC=WINDOMAIN,DC=LOCAL
[08/09/2021 08:21:41] CN=NTDS Settings,CN=DC,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=WINDOMAIN,DC=LOCAL

	msDS-EnabledFeature: CN=Recycle Bin Feature,CN=Optional Features,CN=Directory Service,CN=Windows NT,CN=Services,CN=Configuration,DC=WINDOMAIN,DC=LOCAL
[Summary - DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie.bin (132 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie.bin (132 bytes)



[Summary - CN=Configuration,DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie-config.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

Objects returned: 2

(0) modify CN=NTDS Settings,CN=DC,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=WINDOMAIN,DC=LOCAL

    1> objectGUID: 076be211-b7c2-4eee-b0ba-d2e0656968cb

    1> msDS-EnabledFeature;range=1-1: <GUID=35df0502c8f81e4abb5d5ac363bf8cc7>;CN=Recycle Bin Feature,CN=Optional Features,CN=Directory Service,CN=Windows NT,CN=Services,C
N=Configuration,DC=WINDOMAIN,DC=LOCAL

(1) modify CN=Partitions,CN=Configuration,DC=WINDOMAIN,DC=LOCAL

    1> objectGUID: 79c0bac4-6f24-4439-b0fd-56aabe3256d9

    1> msDS-EnabledFeature;range=1-1: <GUID=35df0502c8f81e4abb5d5ac363bf8cc7>;CN=Recycle Bin Feature,CN=Optional Features,CN=Directory Service,CN=Windows NT,CN=Services,C
N=Configuration,DC=WINDOMAIN,DC=LOCAL

New cookie written to file cookie-config.bin (108 bytes)



[Summary - CN=Schema,CN=Configuration,DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie-schema.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie-schema.bin (108 bytes)
```
