# New User with a bad password

## Scenario

Create an user `newuser` through `dsa.msc` (*Active Directory Users and Computers*) with a password which does not fullfill the password policy.

The recycle bin feature is not enabled.

## Remarks

While the UI throw an error indicating the password is a bad one, the user **has been created** and then, **deleted**.

The `RID Set` modification reflects the RID pool usage.

## Results

```
[08/09/2021 08:16:16] CN=RID Set,CN=DC,OU=Domain Controllers,DC=WINDOMAIN,DC=LOCAL

[08/09/2021 08:16:16] CN=newuser,CN=Users,DC=WINDOMAIN,DC=LOCAL

	objectCategory: CN=Person,CN=Schema,CN=Configuration,DC=WINDOMAIN,DC=LOCAL
	userPrincipalName: newuser@WINDOMAIN.LOCAL
	sAMAccountType: SAM_USER_OBJECT
	sAMAccountName: newuser
	lmPwdHistory: 
	accountExpires: 9223372036854775807
	objectSid: S-1-5-21-678036421-2819006750-2708021855-1111
	primaryGroupID: 513
	pwdLastSet: 0
	ntPwdHistory: 
	unicodePwd: 
	logonHours: 
	dBCSPwd: 
	countryCode: 0
	codePage: 0
	userAccountControl: UF_ACCOUNTDISABLE, UF_PASSWD_NOTREQD, UF_NORMAL_ACCOUNT
	name: newuser
	nTSecurityDescriptor: O:DAG:DAD:AI(A;;LCRPLORC;;;PS)(A;;RC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CR;ab721a53-1
e2f-11d0-9819-00aa0040529b;;WD)(OA;;RPWP;e45795b2-9455-11d1-aebd-0000f80367c1;;PS)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(OA;;RPWP;e45795b3-9455-11d1-aebd-0000f80367c1;;PS)(OA;;CR
;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;CR;ab721a54-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;CR;ab721a56-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;;AU)(O
A;;RP;e48d0154-bcf8-11d1-8702-00c04fb96050;;AU)(OA;;RP;77b5b886-944a-11d1-aebd-0000f80367c1;;AU)(OA;;RP;e45795b3-9455-11d1-aebd-0000f80367c1;;AU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;
S-1-5-32-560)(OA;;RPWP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;;RPWP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;
RP;037088f8-0ae1-11d2-b422-00a0c968f939;;RS)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;;RS)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;;RS)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;;RS)
(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;
RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240
-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-
9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c9
68f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1
-5-21-678036421-2819006750-2708021855-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-2819006750-2708021855-527)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;b
f967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0
de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a2
85-00aa003049e2;ED)(OA;CIIOID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;
;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70
-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-678036421-2819006750-2708021855-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)
	displayName: newuser
	whenCreated: 08/09/2021 08:16:15
	instanceType: 4
	givenName: newuser
	cn: newuser
	objectClass: user
[08/09/2021 08:16:18] CN=newuser\0ADEL:bd288914-07fa-4b53-b1e8-c714c342b985,CN=Deleted Objects,DC=WINDOMAIN,DC=LOCAL

	isRecycled: True
	objectCategory: 
	lastKnownParent: CN=Users,DC=WINDOMAIN,DC=LOCAL
	userPrincipalName: 
Cannot convert null to type "SamAccountType" due to enumeration values that are not valid. Specify one of the following enumeration values and try again. The possible enumeration values are "
SAM_DOMAIN_OBJECT,SAM_GROUP_OBJECT,SAM_NON_SECURITY_GROUP_OBJECT,SAM_ALIAS_OBJECT,SAM_NON_SECURITY_ALIAS_OBJECT,SAM_USER_OBJECT,SAM_MACHINE_ACCOUNT,SAM_TRUST_ACCOUNT,SAM_APP_BASIC_GROUP,SAM_A
PP_QUERY_GROUP".
	sAMAccountType: 
	accountExpires: 
	primaryGroupID: 
	pwdLastSet: 
	countryCode: 
	codePage: 
	name: newuser
DEL:bd288914-07fa-4b53-b1e8-c714c342b985
	isDeleted: True
	displayName: 
	givenName: 
	cn: newuser
DEL:bd288914-07fa-4b53-b1e8-c714c342b985
[Summary - DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie.bin (132 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

Objects returned: 1

(0) delete CN=newuser\0ADEL:bd288914-07fa-4b53-b1e8-c714c342b985,CN=Deleted Objects,DC=WINDOMAIN,DC=LOCAL

    1> parentGUID: b4a1b6ed-1bb9-498a-9cc1-e32c9c69a2b5

    1> objectGUID: bd288914-07fa-4b53-b1e8-c714c342b985

    4> objectClass: top; person; organizationalPerson; user

    0> givenName: 

    1> instanceType: 0x4 = ( WRITE )

    1> whenCreated: 8/9/2021 8:16:15 AM Coordinated Universal Time

    0> displayName: 

    1> isDeleted: TRUE

    1> nTSecurityDescriptor: O:DAG:DAD:AI(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;;RS)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;;RS)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;;RS)(OA
;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;;RS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;RPWP;6db69a1c-9422-11d1-aebd-0
000f80367c1;;S-1-5-32-561)(OA;;RPWP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;C
R;ab721a54-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;CR;ab721a56-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;;AU)(OA;;RP;e48d0154-bcf8-11d1-8702-00c04fb96050;;AU)(
OA;;RP;77b5b886-944a-11d1-aebd-0000f80367c1;;AU)(OA;;RP;e45795b3-9455-11d1-aebd-0000f80367c1;;AU)(OA;;RPWP;77b5b886-944a-11d1-aebd-0000f80367c1;;PS)(OA;;RPWP;e45795b2-9455-11d1-aebd-0000f8036
7c1;;PS)(OA;;RPWP;e45795b3-9455-11d1-aebd-0000f80367c1;;PS)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;AO)(A;;RC;;;AU)(A;;LCRPLORC;;;PS)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO
;;;SY)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;C
IIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;bc
0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2
-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-
00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f306
3;;S-1-5-21-678036421-2819006750-2708021855-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-2819006750-2708021855-527)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d716
5cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf96
7a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-1
1d0-a285-00aa003049e2;ED)(OA;CIIOID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCR
PLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96
f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-678036421-2819006750-2708021855-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRCWDWO;;;BA)S:AI(OU;CIIOIDSA;WP;f30e3bbe
-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CIIOIDSA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)

    1> name: newuser
DEL:bd288914-07fa-4b53-b1e8-c714c342b985

    1> userAccountControl: 0x222 = ( ACCOUNTDISABLE | PASSWD_NOTREQD | NORMAL_ACCOUNT )

    0> codePage: 

    0> countryCode: 

    0> dBCSPwd: 

    0> logonHours: 

    0> unicodePwd: 

    0> ntPwdHistory: 

    0> pwdLastSet: 

    0> primaryGroupID: 

    1> objectSid: S-1-5-21-678036421-2819006750-2708021855-1111

    0> accountExpires: 

    0> lmPwdHistory: 

    1> sAMAccountName: newuser

    0> sAMAccountType: 

    0> userPrincipalName: 

    1> lastKnownParent: <GUID=eb73c3a5919dd74a83ee3729771fe229>;CN=Users,DC=WINDOMAIN,DC=LOCAL

    0> objectCategory: 

    1> isRecycled: TRUE

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
```
