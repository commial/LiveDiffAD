# Computer Offline-join

## Scenario

Use [djoin](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/ff793312(v=ws.11)) to perform an *Offline domain join*:

```powershell
$> djoin /provision /domain WINDOMAIN.LOCAL /machine TEST-COMPUTER /savefile output.secret /machineou OU=T2,DC=WINDOMAIN,DC=LOCAL

Provisioning the computer...
Successfully provisioned [TEST-COMPUTER] in the domain [WINDOMAIN.LOCAL].
Provisioning data was saved successfully to [output.secret].

Computer provisioning completed successfully.
The operation completed successfully.
```

## Remarks

The computer object is directly created in the target OU (this method avoid creating it in `Computers` then moving it).

The `RIDSet` is updated, as a new object is created.

DNS information are not yet created:

```
> test-computer.windomain.local
Server:  [192.168.38.50]
Address:  192.168.38.50

*** [192.168.38.50] can't find test-computer.windomain.local: Non-existent domain
```

## Results

```
[08/27/2021 08:23:46] CN=RID Set,CN=DC,OU=Domain Controllers,DC=WINDOMAIN,DC=LOCAL

[08/27/2021 08:23:46] CN=TEST-COMPUTER,OU=T2,DC=WINDOMAIN,DC=LOCAL

	isCriticalSystemObject: False
	objectCategory: CN=Computer,CN=Schema,CN=Configuration,DC=WINDOMAIN,DC=LOCAL
	servicePrincipalName: RestrictedKrbHost/TEST-COMPUTER HOST/TEST-COMPUTER RestrictedKrbHost/TEST-COMPUTER.WINDOMAIN.LOCAL HOST/TEST-COMPUTER.WINDOMAIN.LOCAL
	dNSHostName: TEST-COMPUTER.WINDOMAIN.LOCAL
	sAMAccountType: SAM_MACHINE_ACCOUNT
	sAMAccountName: TEST-COMPUTER$
	lmPwdHistory: 
	accountExpires: 9223372036854775807
	objectSid: S-1-5-21-678036421-2819006750-2708021855-1117
	supplementalCredentials: 
	primaryGroupID: 515
	pwdLastSet: 132745262259630755
	ntPwdHistory: 
	unicodePwd: 
	logonHours: 
	localPolicyFlags: 0
	dBCSPwd: 
	countryCode: 0
	codePage: 0
	userAccountControl: UF_WORKSTATION_TRUST_ACCOUNT
	name: TEST-COMPUTER
	nTSecurityDescriptor: O:DAG:DAD:AI(A;;CCDC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a53
-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;PS)(OA;;CCDC
;bf967aa8-0de6-11d0-a285-00aa003049e2;;PO)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;
WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf96
7a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-0
0aa003049e2;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a
768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04
fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;b
f967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0
de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-
a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-2819006750-2708021855-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-28
19006750-2708021855-527)(OA;ID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;;DA)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIID;SW;9b026da6-0d3c
-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-
00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a3
5;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967a
ba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-
21-678036421-2819006750-2708021855-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
	whenCreated: 08/27/2021 08:23:45
	instanceType: 4
	cn: TEST-COMPUTER
	objectClass: computer
[Summary - DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie.bin (132 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

Objects returned: 1

(0) add CN=TEST-COMPUTER,OU=T2,DC=WINDOMAIN,DC=LOCAL

    1> parentGUID: 1d4f09c6-cb3f-4aa4-b36d-aad7bbb32346

    1> objectGUID: a0a71ba2-6f92-442e-9fc0-a98a11717124

    5> objectClass: top; person; organizationalPerson; user; computer

    1> instanceType: 0x4 = ( WRITE )

    1> whenCreated: 8/27/2021 8:23:45 AM Coordinated Universal Time

    1> nTSecurityDescriptor: O:DAG:DAD:AI(OA;;WP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;bf967950-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a
285-00aa003049e2;DA)(OA;;WP;bf967953-0de6-11d0-a285-00aa003049e2;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(OA;;WP;3e0abfd0-126a-11d0-a060-00aa006c33ed;bf967a86-0de6-11d0-a285-00aa003049e2;DA)(
OA;;SW;72e39547-7b18-11d1-adef-00c04fd8d5cd;;DA)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;DA)(OA;;WP;4c164200-20c0-11d0-a768-00aa006e0529;;DA)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e
2;;CA)(OA;;CCDC;bf967aa8-0de6-11d0-a285-00aa003049e2;;PO)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;SW;72e39547-7b18-11d1
-adef-00c04fd8d5cd;;PS)(OA;;SW;f3a64788-5306-11d1-a9c5-0000f80367c1;;PS)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(A;;LCRPDTLOCRSDRC;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;CCDC
LCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDC;;;PS)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;
CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP
;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240
-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d
0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00
a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-2819006750-2708021855-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de
88f3063;;S-1-5-21-678036421-2819006750-2708021855-527)(OA;ID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;;DA)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e
2;CO)(OA;CIID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO
ID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;WP;ea1b7
b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;
RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCL
CSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-678036421-2819006750-2708021855-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)S:AI(OU;CIIOIDSA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6
-11d0-a285-00aa003049e2;WD)(OU;CIIOIDSA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)

    1> name: TEST-COMPUTER

    1> userAccountControl: 0x1000 = ( WORKSTATION_TRUST_ACCOUNT )

    1> codePage: 0

    1> countryCode: 0

    0> dBCSPwd: 

    1> localPolicyFlags: 0

    0> logonHours: 

    0> unicodePwd: 

    0> ntPwdHistory: 

    1> pwdLastSet: 8/27/2021 8:23:45 AM Coordinated Universal Time

    1> primaryGroupID: 515 = ( GROUP_RID_COMPUTERS )

    0> supplementalCredentials: 

    1> objectSid: S-1-5-21-678036421-2819006750-2708021855-1117

    1> accountExpires: (never)

    0> lmPwdHistory: 

    1> sAMAccountName: TEST-COMPUTER$

    1> sAMAccountType: 805306369 = ( MACHINE_ACCOUNT )

    1> dNSHostName: TEST-COMPUTER.WINDOMAIN.LOCAL

    4> servicePrincipalName: RestrictedKrbHost/TEST-COMPUTER; HOST/TEST-COMPUTER; RestrictedKrbHost/TEST-COMPUTER.WINDOMAIN.LOCAL; HOST/TEST-COMPUTER.WINDOMAIN.LOCAL

    1> objectCategory: <GUID=aa324d29b039bd46ba918ac9b212cdb5>;CN=Computer,CN=Schema,CN=Configuration,DC=WINDOMAIN,DC=LOCAL

    1> isCriticalSystemObject: FALSE

New cookie written to file cookie.bin (132 bytes)



[Summary - CN=Configuration,DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie-config.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie-config.bin (108 bytes)



[Summary - CN=Schema,CN=Configuration,DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie-schema.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie-schema.bin (108 bytes)



[Summary - DC=ForestDnsZones,DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie-forestdns.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie-forestdns.bin (108 bytes)



[Summary - DC=DomainDnsZones,DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie-domaindns.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie-domaindns.bin (108 bytes)
```