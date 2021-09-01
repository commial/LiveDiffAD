# Domain join with UI

## Scenario

Join `SRV` to `WINDOMAIN.LOCAL` through the UI *Computer > Properties*.
Use `WINDOMAIN.LOCAL\Administrator` credentials.

## Remarks

There are two main steps:

1. Domain join on *Apply changes* (click in the UI). This is similar to [djoin.md](djoin.md).

The RID set is modifed as a new object is created.
Several updates are made to the object just after its creation.

2. First reboot of the computer

The DNS entry for the server is created on the first reboot, not on domain join (as in [djoin.md](djoin.md))
Again, several updates are made.

The replication metadata of `SRV` are:
```
 AttID	   Ver	 Loc.USN	                  Originating DSA			 Org.USN	     Org.Time/Date
 =====	   ===	 =======	                  ===============		 =======	     =============
     0	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
     3	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 20001	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 20002	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 20119	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 90001	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 90008	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 90010	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 90019	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 90037	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 90038	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 90040	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 9005a	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 9005e	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 90060	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 90062	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 9007d	     1	   24669	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24669	2021-08-30 16:43:02
 90092	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 9009f	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 900a0	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 900dd	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 9012e	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 9016b	     1	   24672	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24672	2021-08-30 16:43:03
 9016c	     1	   24672	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24672	2021-08-30 16:43:03
 9026b	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 90303	     3	   24682	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24682	2021-08-30 16:44:50
 9030e	     1	   24667	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24667	2021-08-30 16:43:02
 90364	     1	   24668	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24668	2021-08-30 16:43:02
 906a0	     1	   24670	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24670	2021-08-30 16:43:03
 907ab	     1	   24680	3a0d1b30-2be5-4a9d-882f-5dcff9d0c7ee	   24680	2021-08-30 16:44:50
```

For instance, `90303` (`Service-Principal-Name` thanks to [convert_attid](../utils/convert_attid.py)), is updated 3 times.

At the creation, SPNs are:

* `RestrictedKrbHost/SRV`
* `HOST/SRV`
* `RestrictedKrbHost/srv.windomain.local`
* `HOST/srv.windomain.local`

After the first reboot, these SPNs are added:

* `TERMSRV/SRV`
* ` TERMSRV/srv.windomain.local`

## Results

### Apply change in UI

```
[08/30/2021 16:43:03] CN=Administrator,CN=Users,DC=windomain,DC=local

[08/30/2021 16:43:06] CN=Administrator,CN=Users,DC=windomain,DC=local

[08/30/2021 16:43:06] CN=RID Set,CN=DC,OU=Domain Controllers,DC=windomain,DC=local

        objectCategory: CN=RID-Set,CN=Schema,CN=Configuration,DC=windomain,DC=local
        rIDUsedPool: 0
        rIDAllocationPool: 6871947674701
        name: RID Set
        nTSecurityDescriptor: O:DAG:DAD:AI(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-527)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
        showInAdvancedViewOnly: True
        whenCreated: 08/30/2021 08:11:19
        instanceType: 4
        cn: RID Set
        objectClass: rIDSet
[08/30/2021 16:43:06] CN=SRV,CN=Computers,DC=windomain,DC=local

        lastLogonTimestamp: 132748153830015323
        isCriticalSystemObject: False
        objectCategory: CN=Computer,CN=Schema,CN=Configuration,DC=windomain,DC=local
        servicePrincipalName: RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
        dNSHostName: srv.windomain.local
        operatingSystemVersion: 10.0 (17763)
        operatingSystem: Windows Server 2019 Standard Evaluation
        sAMAccountType: SAM_MACHINE_ACCOUNT
        sAMAccountName: SRV$
        lmPwdHistory:
        accountExpires: 9223372036854775807
        objectSid: S-1-5-21-438980702-1619239835-3961497941-1108
        supplementalCredentials:
        primaryGroupID: 515
        pwdLastSet: 132748153827681319
        ntPwdHistory:
        unicodePwd:
        logonHours:
        localPolicyFlags: 0
        dBCSPwd:
        countryCode: 0
        codePage: 0
        userAccountControl: UF_WORKSTATION_TRUST_ACCOUNT
        name: SRV
        nTSecurityDescriptor: O:DAG:DAD:AI(A;;CCDC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;PS)(OA;;CCDC;bf967aa8-0de6-11d0-a285-00aa003049e2;;PO)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-527)(OA;ID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;;DA)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
        whenCreated: 08/30/2021 16:43:02
        instanceType: 4
        cn: SRV
        objectClass: computer
[08/30/2021 16:43:06] CN=SRV,CN=Computers,DC=windomain,DC=local

        lastLogonTimestamp: 132748153830015323
        isCriticalSystemObject: False
        objectCategory: CN=Computer,CN=Schema,CN=Configuration,DC=windomain,DC=local
        servicePrincipalName: RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
        dNSHostName: srv.windomain.local
        operatingSystemVersion: 10.0 (17763)
        operatingSystem: Windows Server 2019 Standard Evaluation
        sAMAccountType: SAM_MACHINE_ACCOUNT
        sAMAccountName: SRV$
        lmPwdHistory:
        accountExpires: 9223372036854775807
        objectSid: S-1-5-21-438980702-1619239835-3961497941-1108
        supplementalCredentials:
        primaryGroupID: 515
        pwdLastSet: 132748153827681319
        ntPwdHistory:
        unicodePwd:
        logonHours:
        localPolicyFlags: 0
        dBCSPwd:
        countryCode: 0
        codePage: 0
        userAccountControl: UF_WORKSTATION_TRUST_ACCOUNT
        name: SRV
        nTSecurityDescriptor: O:DAG:DAD:AI(A;;CCDC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;PS)(OA;;CCDC;bf967aa8-0de6-11d0-a285-00aa003049e2;;PO)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-527)(OA;ID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;;DA)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
        whenCreated: 08/30/2021 16:43:02
        instanceType: 4
        cn: SRV
        objectClass: computer
[08/30/2021 16:43:06] CN=SRV,CN=Computers,DC=windomain,DC=local

        lastLogonTimestamp: 132748153830015323
        isCriticalSystemObject: False
        objectCategory: CN=Computer,CN=Schema,CN=Configuration,DC=windomain,DC=local
        servicePrincipalName: RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
        dNSHostName: srv.windomain.local
        operatingSystemVersion: 10.0 (17763)
        operatingSystem: Windows Server 2019 Standard Evaluation
        sAMAccountType: SAM_MACHINE_ACCOUNT
        sAMAccountName: SRV$
        lmPwdHistory:
        accountExpires: 9223372036854775807
        objectSid: S-1-5-21-438980702-1619239835-3961497941-1108
        supplementalCredentials:
        primaryGroupID: 515
        pwdLastSet: 132748153827681319
        ntPwdHistory:
        unicodePwd:
        logonHours:
        localPolicyFlags: 0
        dBCSPwd:
        countryCode: 0
        codePage: 0
        userAccountControl: UF_WORKSTATION_TRUST_ACCOUNT
        name: SRV
        nTSecurityDescriptor: O:DAG:DAD:AI(A;;CCDC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;PS)(OA;;CCDC;bf967aa8-0de6-11d0-a285-00aa003049e2;;PO)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-527)(OA;ID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;;DA)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
        whenCreated: 08/30/2021 16:43:02
        instanceType: 4
        cn: SRV
        objectClass: computer
[08/30/2021 16:43:06] CN=SRV,CN=Computers,DC=windomain,DC=local

        lastLogonTimestamp: 132748153830015323
        isCriticalSystemObject: False
        objectCategory: CN=Computer,CN=Schema,CN=Configuration,DC=windomain,DC=local
        servicePrincipalName: RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
        dNSHostName: srv.windomain.local
        operatingSystemVersion: 10.0 (17763)
        operatingSystem: Windows Server 2019 Standard Evaluation
        sAMAccountType: SAM_MACHINE_ACCOUNT
        sAMAccountName: SRV$
        lmPwdHistory:
        accountExpires: 9223372036854775807
        objectSid: S-1-5-21-438980702-1619239835-3961497941-1108
        supplementalCredentials:
        primaryGroupID: 515
        pwdLastSet: 132748153827681319
        ntPwdHistory:
        unicodePwd:
        logonHours:
        localPolicyFlags: 0
        dBCSPwd:
        countryCode: 0
        codePage: 0
        userAccountControl: UF_WORKSTATION_TRUST_ACCOUNT
        name: SRV
        nTSecurityDescriptor: O:DAG:DAD:AI(A;;CCDC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;PS)(OA;;CCDC;bf967aa8-0de6-11d0-a285-00aa003049e2;;PO)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-527)(OA;ID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;;DA)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
        whenCreated: 08/30/2021 16:43:02
        instanceType: 4
        cn: SRV
        objectClass: computer
[08/30/2021 16:43:07] CN=SRV,CN=Computers,DC=windomain,DC=local

        lastLogonTimestamp: 132748153830015323
        isCriticalSystemObject: False
        objectCategory: CN=Computer,CN=Schema,CN=Configuration,DC=windomain,DC=local
        servicePrincipalName: RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
        dNSHostName: srv.windomain.local
        operatingSystemVersion: 10.0 (17763)
        operatingSystem: Windows Server 2019 Standard Evaluation
        sAMAccountType: SAM_MACHINE_ACCOUNT
        sAMAccountName: SRV$
        lmPwdHistory:
        accountExpires: 9223372036854775807
        objectSid: S-1-5-21-438980702-1619239835-3961497941-1108
        supplementalCredentials:
        primaryGroupID: 515
        pwdLastSet: 132748153827681319
        ntPwdHistory:
        unicodePwd:
        logonHours:
        localPolicyFlags: 0
        dBCSPwd:
        countryCode: 0
        codePage: 0
        userAccountControl: UF_WORKSTATION_TRUST_ACCOUNT
        name: SRV
        nTSecurityDescriptor: O:DAG:DAD:AI(A;;CCDC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;PS)(OA;;CCDC;bf967aa8-0de6-11d0-a285-00aa003049e2;;PO)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-527)(OA;ID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;;DA)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
        whenCreated: 08/30/2021 16:43:02
        instanceType: 4
        cn: SRV
        objectClass: computer
[08/30/2021 16:43:07] CN=SRV,CN=Computers,DC=windomain,DC=local

        lastLogonTimestamp: 132748153830015323
        isCriticalSystemObject: False
        objectCategory: CN=Computer,CN=Schema,CN=Configuration,DC=windomain,DC=local
        servicePrincipalName: RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
        dNSHostName: srv.windomain.local
        operatingSystemVersion: 10.0 (17763)
        operatingSystem: Windows Server 2019 Standard Evaluation
        sAMAccountType: SAM_MACHINE_ACCOUNT
        sAMAccountName: SRV$
        lmPwdHistory:
        accountExpires: 9223372036854775807
        objectSid: S-1-5-21-438980702-1619239835-3961497941-1108
        supplementalCredentials:
        primaryGroupID: 515
        pwdLastSet: 132748153827681319
        ntPwdHistory:
        unicodePwd:
        logonHours:
        localPolicyFlags: 0
        dBCSPwd:
        countryCode: 0
        codePage: 0
        userAccountControl: UF_WORKSTATION_TRUST_ACCOUNT
        name: SRV
        nTSecurityDescriptor: O:DAG:DAD:AI(A;;CCDC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;PS)(OA;;CCDC;bf967aa8-0de6-11d0-a285-00aa003049e2;;PO)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-527)(OA;ID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;;DA)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
        whenCreated: 08/30/2021 16:43:02
        instanceType: 4
        cn: SRV
        objectClass: computer
[Summary - DC=windomain,DC=local]
Using cookie from file cookie.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

Objects returned: 1

(0) add CN=SRV,CN=Computers,DC=windomain,DC=local

    1> parentGUID: c4c3a302-7d8d-4308-abac-57fab4f760b4

    1> objectGUID: 7423e873-44f0-4f07-94df-6b6d4aa587e9

    5> objectClass: top; person; organizationalPerson; user; computer

    1> instanceType: 0x4 = ( WRITE )

    1> whenCreated: 8/30/2021 4:43:02 PM Coordinated Universal Time

    1> nTSecurityDescriptor: O:DAG:DAD:AI(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;CCDC;bf967aa8-0de6-11d0-a285-00aa003049e2;;PO)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(A;;LCRPDTLOCRSDRC;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-438980702-1619239835-3961497941-527)(OA;ID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;;DA)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)S:AI(OU;CIIOIDSA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CIIOIDSA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)

    1> name: SRV

    1> userAccountControl: 0x1000 = ( WORKSTATION_TRUST_ACCOUNT )

    1> codePage: 0

    1> countryCode: 0

    0> dBCSPwd:

    1> localPolicyFlags: 0

    0> logonHours:

    0> unicodePwd:

    0> ntPwdHistory:

    1> pwdLastSet: 8/30/2021 4:43:02 PM Coordinated Universal Time

    1> primaryGroupID: 515 = ( GROUP_RID_COMPUTERS )

    0> supplementalCredentials:

    1> objectSid: S-1-5-21-438980702-1619239835-3961497941-1108

    1> accountExpires: (never)

    0> lmPwdHistory:

    1> sAMAccountName: SRV$

    1> sAMAccountType: 805306369 = ( MACHINE_ACCOUNT )

    1> operatingSystem: Windows Server 2019 Standard Evaluation

    1> operatingSystemVersion: 10.0 (17763)

    1> dNSHostName: srv.windomain.local

    4> servicePrincipalName: RestrictedKrbHost/SRV; HOST/SRV; RestrictedKrbHost/srv.windomain.local; HOST/srv.windomain.local

    1> objectCategory: <GUID=3e7cba64919a6f42ba8172322f4f0bd3>;CN=Computer,CN=Schema,CN=Configuration,DC=windomain,DC=local

    1> isCriticalSystemObject: FALSE

    1> lastLogonTimestamp: 8/30/2021 4:43:03 PM Coordinated Universal Time

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

### First reboot

```
[08/30/2021 16:44:51] CN=SRV,CN=Computers,DC=windomain,DC=local

        msDS-SupportedEncryptionTypes: RC4_HMAC_MD5, AES128_CTS_HMAC_SHA1_96, AES256_CTS_HMAC_SHA1_96
        servicePrincipalName: TERMSRV/SRV TERMSRV/srv.windomain.local RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
[08/30/2021 16:44:52] CN=SRV,CN=Computers,DC=windomain,DC=local

        msDS-SupportedEncryptionTypes: RC4_HMAC_MD5, AES128_CTS_HMAC_SHA1_96, AES256_CTS_HMAC_SHA1_96
        servicePrincipalName: TERMSRV/SRV TERMSRV/srv.windomain.local RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
[08/30/2021 16:44:52] CN=SRV,CN=Computers,DC=windomain,DC=local

        msDS-SupportedEncryptionTypes: RC4_HMAC_MD5, AES128_CTS_HMAC_SHA1_96, AES256_CTS_HMAC_SHA1_96
        servicePrincipalName: TERMSRV/SRV TERMSRV/srv.windomain.local RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
[08/30/2021 16:44:52] CN=SRV,CN=Computers,DC=windomain,DC=local

        msDS-SupportedEncryptionTypes: RC4_HMAC_MD5, AES128_CTS_HMAC_SHA1_96, AES256_CTS_HMAC_SHA1_96
        servicePrincipalName: TERMSRV/SRV TERMSRV/srv.windomain.local RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
[08/30/2021 16:44:52] CN=SRV,CN=Computers,DC=windomain,DC=local

        msDS-SupportedEncryptionTypes: RC4_HMAC_MD5, AES128_CTS_HMAC_SHA1_96, AES256_CTS_HMAC_SHA1_96
        servicePrincipalName: TERMSRV/SRV TERMSRV/srv.windomain.local RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
[08/30/2021 16:44:52] CN=SRV,CN=Computers,DC=windomain,DC=local

        msDS-SupportedEncryptionTypes: RC4_HMAC_MD5, AES128_CTS_HMAC_SHA1_96, AES256_CTS_HMAC_SHA1_96
        servicePrincipalName: TERMSRV/SRV TERMSRV/srv.windomain.local RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
[08/30/2021 16:44:52] CN=SRV,CN=Computers,DC=windomain,DC=local

        msDS-SupportedEncryptionTypes: RC4_HMAC_MD5, AES128_CTS_HMAC_SHA1_96, AES256_CTS_HMAC_SHA1_96
        servicePrincipalName: TERMSRV/SRV TERMSRV/srv.windomain.local RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
[08/30/2021 16:44:52] CN=SRV,CN=Computers,DC=windomain,DC=local

        msDS-SupportedEncryptionTypes: RC4_HMAC_MD5, AES128_CTS_HMAC_SHA1_96, AES256_CTS_HMAC_SHA1_96
        servicePrincipalName: TERMSRV/SRV TERMSRV/srv.windomain.local RestrictedKrbHost/SRV HOST/SRV RestrictedKrbHost/srv.windomain.local HOST/srv.windomain.local
[08/30/2021 16:44:56] DC=srv,DC=windomain.local,CN=MicrosoftDNS,DC=DomainDnsZones,DC=windomain,DC=local

        dc: srv
        objectCategory: CN=Dns-Node,CN=Schema,CN=Configuration,DC=windomain,DC=local
        dnsRecord: 4 0 1 0 5 240 0 0 33 0 0 0 0 0 4 176 0 0 0 0 24 68 56 0 192 168 38 50
        name: srv
        nTSecurityDescriptor: O:S-1-5-21-438980702-1619239835-3961497941-1108G:DCD:AI(A;;LCRPLORC;;;WD)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;ED)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-1108)(A;CIID;CCDCLCSWRPWPDTCRSDRCWDWO;;;ED)(A;CIID;CCDCLCSWRPWPDTCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-1102)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
        showInAdvancedViewOnly: True
        whenCreated: 08/30/2021 16:44:55
        instanceType: 4
        objectClass: dnsNode
[08/30/2021 16:44:57] CN=SRV,CN=Computers,DC=windomain,DC=local

[08/30/2021 16:45:00] CN=SRV,CN=Computers,DC=windomain,DC=local

[08/30/2021 16:45:01] CN=SRV,CN=Computers,DC=windomain,DC=local

[Summary - DC=windomain,DC=local]
Using cookie from file cookie.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

Objects returned: 1

(0) modify CN=SRV,CN=Computers,DC=windomain,DC=local

    1> objectGUID: 7423e873-44f0-4f07-94df-6b6d4aa587e9

    1> instanceType: 0x4 = ( WRITE )

    6> servicePrincipalName: TERMSRV/SRV; TERMSRV/srv.windomain.local; RestrictedKrbHost/SRV; HOST/SRV; RestrictedKrbHost/srv.windomain.local; HOST/srv.windomain.local

    1> msDS-SupportedEncryptionTypes: 0x1C = ( RC4_HMAC_MD5 | AES128_CTS_HMAC_SHA1_96 | AES256_CTS_HMAC_SHA1_96 )

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

Objects returned: 1

(0) add DC=srv,DC=windomain.local,CN=MicrosoftDNS,DC=DomainDnsZones,DC=windomain,DC=local

    1> parentGUID: 41fc6768-b131-4b8d-9c38-8fcfbb17fca8

    1> objectGUID: 8daf933f-3d72-482d-9d07-ecc687c841a3

    2> objectClass: top; dnsNode

    1> instanceType: 0x4 = ( WRITE )

    1> whenCreated: 8/30/2021 4:44:55 PM Coordinated Universal Time

    1> showInAdvancedViewOnly: TRUE

    1> nTSecurityDescriptor: O:S-1-5-21-438980702-1619239835-3961497941-1108G:DCD:AI(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-1108)(A;;LCRPLORC;;;WD)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;ED)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;CIID;CCDCLCSWRPWPDTCRSDRCWDWO;;;ED)(A;CIID;CCDCLCSWRPWPDTCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-1102)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)S:AI(OU;CIIOIDSA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CIIOIDSA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)

    1> name: srv

    1> dnsRecord: <28 byte blob>

    1> objectCategory: <GUID=8fb915d7a780a543adab3043be519fe7>;CN=Dns-Node,CN=Schema,CN=Configuration,DC=windomain,DC=local

New cookie written to file cookie-domaindns.bin (108 bytes)
```