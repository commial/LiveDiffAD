# New gMSA account

## Scenario

```powershell
New-ADServiceAccount ITFarm1 -DNSHostName ITFarm1.windomain.local -PrincipalsAllowedToRetrieveManagedPassword vagrant -KerberosEncryptionType RC4, AES128, AES256 -ServicePrincipalNames http/ITFarm1.contoso.com/contoso.com, http/ITFarm1.contoso.com/contoso, http/ITFarm1/contoso.com, http/ITFarm1/contoso
```

## Results

```
[12/03/2021 15:24:10] CN=ITFarm1,CN=Managed Service Accounts,DC=windomain,DC=local

        msDS-GroupMSAMembership: System.DirectoryServices.ActiveDirectorySecurity
        msDS-ManagedPasswordInterval: 30
        msDS-ManagedPasswordId: 1 0 0 0 75 68 83 75 2 0 0 0 104 1 0 0 10 0 0 0 12 0 0 0 225 105 77 17 57 241 108 150 196 232 97 165 39 90 66 230 0 0 0 0 32 0 0 0 32 0 0 0 119 0 105 0 110 0 100 0 111 0 109 0 97 0 105 0 110 0 46 0 108 0 111 0 99 0 97 0 108 0 0 0 119 0 105 0 110 0 100 0 111 0 109 0 97 0 105 0 110 0 46 0 108 0 111 0 99 0 97 0 108 0 0 0
        msDS-SupportedEncryptionTypes: RC4_HMAC_MD5, AES128_CTS_HMAC_SHA1_96, AES256_CTS_HMAC_SHA1_96
        isCriticalSystemObject: False
        objectCategory: CN=ms-DS-Group-Managed-Service-Account,CN=Schema,CN=Configuration,DC=windomain,DC=local
        servicePrincipalName: http/ITFarm1/contoso http/ITFarm1/contoso.com http/ITFarm1.contoso.com/contoso http/ITFarm1.contoso.com/contoso.com
        dNSHostName: ITFarm1.windomain.local
        sAMAccountType: SAM_MACHINE_ACCOUNT
        sAMAccountName: ITFarm1$
        lmPwdHistory:
        accountExpires: 9223372036854775807
        objectSid: S-1-5-21-438980702-1619239835-3961497941-1113
        supplementalCredentials:
        primaryGroupID: 515
        pwdLastSet: 132830186485851113
        ntPwdHistory:
        unicodePwd:
        logonHours:
        localPolicyFlags: 0
        dBCSPwd:
        countryCode: 0
        codePage: 0
        userAccountControl: UF_WORKSTATION_TRUST_ACCOUNT
        name: ITFarm1
        nTSecurityDescriptor: O:DAG:DAD:AI(OD;;CR;00299570-246d-11d0-a768-00aa006e0529;;WD)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;RP;e362ed86-b728-0842-b27d-2dea7a9df218;;WD)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;PS)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-527)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
        whenCreated: 12/03/2021 15:24:08
        instanceType: 4
        cn: ITFarm1
        objectClass: msDS-GroupManagedServiceAccount
[Summary - DC=windomain,DC=local]
Using cookie from file cookie.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

Objects returned: 1

(0) add CN=ITFarm1,CN=Managed Service Accounts,DC=windomain,DC=local

    1> parentGUID: 9a61c686-14e3-4db5-a90e-6d7e98d7d52f

    1> objectGUID: 1b7d959b-b49f-497d-a9cf-2b77f96ae2e3

    6> objectClass: top; person; organizationalPerson; user; computer; msDS-GroupManagedServiceAccount

    1> instanceType: 0x4 = ( WRITE )

    1> whenCreated: 12/3/2021 3:24:08 PM Coordinated Universal Time

    1> nTSecurityDescriptor: O:DAG:DAD:AI(OD;;CR;00299570-246d-11d0-a768-00aa006e0529;;WD)(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;RP;e362ed86-b728-0842-b27d-2dea7a9df218;;WD)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(A;;LCRPDTLOCRSDRC;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-527)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)S:AI(OU;CIIOIDSA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CIIOIDSA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)

    1> name: ITFarm1

    1> userAccountControl: 0x1000 = ( WORKSTATION_TRUST_ACCOUNT )

    1> codePage: 0

    1> countryCode: 0

    0> dBCSPwd:

    1> localPolicyFlags: 0

    0> logonHours:

    0> unicodePwd:

    0> ntPwdHistory:

    1> pwdLastSet: 12/3/2021 3:24:08 PM Coordinated Universal Time

    1> primaryGroupID: 515 = ( GROUP_RID_COMPUTERS )

    0> supplementalCredentials:

    1> objectSid: S-1-5-21-438980702-1619239835-3961497941-1113

    1> accountExpires: (never)

    0> lmPwdHistory:

    1> sAMAccountName: ITFarm1$

    1> sAMAccountType: 805306369 = ( MACHINE_ACCOUNT )

    1> dNSHostName: ITFarm1.windomain.local

    4> servicePrincipalName: http/ITFarm1/contoso; http/ITFarm1/contoso.com; http/ITFarm1.contoso.com/contoso; http/ITFarm1.contoso.com/contoso.com

    1> objectCategory: <GUID=ae4f8ce114ab174fa460dbb83656aaba>;CN=ms-DS-Group-Managed-Service-Account,CN=Schema,CN=Configuration,DC=windomain,DC=local

    1> isCriticalSystemObject: FALSE

    1> msDS-SupportedEncryptionTypes: 0x1C = ( RC4_HMAC_MD5 | AES128_CTS_HMAC_SHA1_96 | AES256_CTS_HMAC_SHA1_96 )

    1> msDS-ManagedPasswordId: <116 byte blob>

    1> msDS-ManagedPasswordInterval: 30

    1> msDS-GroupMSAMembership: <80 byte blob>

New cookie written to file cookie.bin (108 bytes)



[Summary - CN=Configuration,DC=windomain,DC=local]
Using cookie from file cookie-config.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie-config.bin (108 bytes)



[Summary - CN=Schema,CN=Configuration,DC=windomain,DC=local]
Using cookie from file cookie-schema.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie-schema.bin (108 bytes)



[Summary - DC=ForestDnsZones,DC=windomain,DC=local]
Using cookie from file cookie-forestdns.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie-forestdns.bin (108 bytes)



[Summary - DC=DomainDnsZones,DC=windomain,DC=local]
Using cookie from file cookie-domaindns.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie-domaindns.bin (108 bytes)
```