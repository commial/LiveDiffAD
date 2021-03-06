# OU Creation

## Scenario

Creation of the Organizational Unit (OU) `TEST-OU` in the root domain through `dsa.msc`.

## Remarks

Two changes of `CN=Organizational-Unit,CN=Schema,CN=Configuration,DC=WINDOMAIN,DC=LOCAL` are reported.
Indeed, if one looks at the replication metadata of the resulting object:

```
Getting 'OU=TEST-OU,DC=WINDOMAIN,DC=LOCAL' metadata...
7 entries.
 AttID	   Ver	 Loc.USN	                  Originating DSA			 Org.USN	     Org.Time/Date
 =====	   ===	 =======	                  ===============		 =======	     =============
     0	     1	   57402	076be211-b7c2-4eee-b0ba-d2e0656968cb	   57402	2021-08-27 08:31:03
     b	     1	   57402	076be211-b7c2-4eee-b0ba-d2e0656968cb	   57402	2021-08-27 08:31:03
 20001	     1	   57402	076be211-b7c2-4eee-b0ba-d2e0656968cb	   57402	2021-08-27 08:31:03
 20002	     1	   57402	076be211-b7c2-4eee-b0ba-d2e0656968cb	   57402	2021-08-27 08:31:03
 20119	     2	   57403	076be211-b7c2-4eee-b0ba-d2e0656968cb	   57403	2021-08-27 08:31:03
 90001	     1	   57402	076be211-b7c2-4eee-b0ba-d2e0656968cb	   57402	2021-08-27 08:31:03
 9030e	     1	   57402	076be211-b7c2-4eee-b0ba-d2e0656968cb	   57402	2021-08-27 08:31:03
```

Attribute ID `20119` has been modified twice.

Using [this conversion script](../utils/convert_attid.py), one can obtain the corresponding OID:
```sh
$ python3 convert_attid.py --attid 0x20119
1.2.840.113556.1.2.281
```

The corresponding attribute is then [nTSecurityDescriptor](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-ada3/b4a3c9be-5388-4e0d-9f5e-96d21a801a3f).

## Results

```
[08/27/2021 08:31:03] OU=TEST-OU,DC=WINDOMAIN,DC=LOCAL

	objectCategory: CN=Organizational-Unit,CN=Schema,CN=Configuration,DC=WINDOMAIN,DC=LOCAL
	name: TEST-OU
	nTSecurityDescriptor: O:DAG:DAD:AI(D;;DTSD;;;WD)(A;;LCRPLORC;;;ED)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CCDC;bf967aba-0de6-11d0-a285-
00aa003049e2;;AO)(OA;;CCDC;bf967a9c-0de6-11d0-a285-00aa003049e2;;AO)(OA;;CCDC;bf967a86-0de6-11d0-a285-00aa003049e2;;AO)(OA;;CCDC;4828cc14-1437-45bc-9b07-ad6f015e5f28;;AO)(OA;;CCDC;bf967aa8-0d
e6-11d0-a285-00aa003049e2;;PO)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-
a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa
003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;
RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CI
IOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5
b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-2819006750-2708021855-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-2819006750-2708021855-527)(OA;CIIOID;S
W;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;RP;b7c69e6
d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11
d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc
-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116
ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-678036421-2819006750-2708021855-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRC
WDWO;;;BA)
	whenCreated: 08/27/2021 08:31:03
	instanceType: 4
	ou: TEST-OU
	objectClass: organizationalUnit
[08/27/2021 08:31:03] OU=TEST-OU,DC=WINDOMAIN,DC=LOCAL

	objectCategory: CN=Organizational-Unit,CN=Schema,CN=Configuration,DC=WINDOMAIN,DC=LOCAL
	name: TEST-OU
	nTSecurityDescriptor: O:DAG:DAD:AI(D;;DTSD;;;WD)(A;;LCRPLORC;;;ED)(A;;LCRPLORC;;;AU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(OA;;CCDC;bf967aba-0de6-11d0-a285-
00aa003049e2;;AO)(OA;;CCDC;bf967a9c-0de6-11d0-a285-00aa003049e2;;AO)(OA;;CCDC;bf967a86-0de6-11d0-a285-00aa003049e2;;AO)(OA;;CCDC;4828cc14-1437-45bc-9b07-ad6f015e5f28;;AO)(OA;;CCDC;bf967aa8-0d
e6-11d0-a285-00aa003049e2;;PO)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-
a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa
003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;
RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CI
IOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;RPWP;5
b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-2819006750-2708021855-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-2819006750-2708021855-527)(OA;CIIOID;S
W;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;RP;b7c69e6
d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11
d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-1437-45bc
-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116
ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-678036421-2819006750-2708021855-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLOCRSDRC
WDWO;;;BA)
	whenCreated: 08/27/2021 08:31:03
	instanceType: 4
	ou: TEST-OU
	objectClass: organizationalUnit
[Summary - DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie.bin (132 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

Objects returned: 1

(0) add OU=TEST-OU,DC=WINDOMAIN,DC=LOCAL

    1> parentGUID: ccb9bf3f-aff9-4909-a203-46eb9121e216

    1> objectGUID: 52fa600a-92d9-4bab-a58d-173cf8e8a66b

    2> objectClass: top; organizationalUnit

    1> instanceType: 0x4 = ( WRITE )

    1> whenCreated: 8/27/2021 8:31:03 AM Coordinated Universal Time

    1> nTSecurityDescriptor: O:DAG:DAD:AI(D;;DTSD;;;WD)(OA;;CCDC;4828cc14-1437-45bc-9b07-ad6f015e5f28;;AO)(OA;;CCDC;bf967a86-0de6-11d0-a285-00aa003049e2;;AO)(OA;;CCDC;bf967a9c-0de6-11d0-a285-
00aa003049e2;;AO)(OA;;CCDC;bf967aa8-0de6-11d0-a285-00aa003049e2;;PO)(OA;;CCDC;bf967aba-0de6-11d0-a285-00aa003049e2;;AO)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;LCRPLORC;;;ED)(A;;LCRPLORC;;;AU)
(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6
-11d0-a285-00aa003049e2;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a28
5-00aa003049e2;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003
049e2;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)
(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIID;
RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-2819006750-2708021855-526)(OA;CIID;RPWP;5b47d60f-6090-40b2-9f37-2a4de88f3063;;S-1-5-21-678036421-2819006750-2708021855-527)(OA;CI
IOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)(OA;CIIOID;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;RP;b
7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;RP;b7c69e6d-2
cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIOID;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIOID;LCRPLORC;;4828cc14-143
7-45bc-9b07-ad6f015e5f28;RU)(OA;CIIOID;LCRPLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIOID;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;OICIID;RPWP;3f78c3e5-f79a-46bd-a0b8-9
d18116ddc79;;PS)(OA;CIID;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(A;CIID;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-678036421-2819006750-2708021855-519)(A;CIID;LC;;;RU)(A;CIID;CCLCSWRPWPLO
CRSDRCWDWO;;;BA)S:AI(OU;CIIDSA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CIIDSA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa0
03049e2;WD)

    1> name: TEST-OU

    1> objectCategory: <GUID=939e4d49fff75549a1e107b39e9f17d4>;CN=Organizational-Unit,CN=Schema,CN=Configuration,DC=WINDOMAIN,DC=LOCAL

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