# PrimaryGroupID update

## Scenario

Update the Primary Group ID of user `Test` from `Domain Users` to `ExampleGroup`, through `dsa.msc`.

## Remarks

As explained in [this article](https://github.com/commial/experiments/tree/master/windows/random_things/primaryGroupID), changing the `primaryGroupID` actually modifies 3 elements:

* `test`'s `primaryGroupID` is set to the new value
* `test` is no longer a member of the `primaryGroupID`'s corresponding group
* `test` is now a member of the older ``primaryGroupID`'s corresponding group

## Results

```
[08/27/2021 09:18:37] CN=ExampleGroup,CN=Users,DC=WINDOMAIN,DC=LOCAL

	member: CN=test,CN=Users,DC=WINDOMAIN,DC=LOCAL
[08/27/2021 09:18:37] CN=Domain Users,CN=Users,DC=WINDOMAIN,DC=LOCAL

	member: CN=test,CN=Users,DC=WINDOMAIN,DC=LOCAL
[08/27/2021 09:18:37] CN=test,CN=Users,DC=WINDOMAIN,DC=LOCAL

	primaryGroupID: 1114
[Summary - DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie.bin (132 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

Objects returned: 3

(0) modify CN=test,CN=Users,DC=WINDOMAIN,DC=LOCAL

    1> objectGUID: ed7f1acd-fa41-413a-a419-2dd4846a104a

    1> instanceType: 0x4 = ( WRITE )

    1> primaryGroupID: 1114

(1) modify CN=Domain Users,CN=Users,DC=WINDOMAIN,DC=LOCAL

    1> objectGUID: a3f643a4-5881-4320-b502-5c495b8731f4

    1> member;range=1-1: <GUID=cd1a7fed41fa3a41a4192dd4846a104a>;<SID=010500000000000515000000c5036a281ea106a85f2269a159040000>;CN=test,CN=Users,DC=WINDOMAIN,DC=LOCAL

(2) modify CN=ExampleGroup,CN=Users,DC=WINDOMAIN,DC=LOCAL

    1> objectGUID: 9a2299fb-3ab0-429a-abeb-3e9e22311d9e

    1> member;range=0-0: <GUID=cd1a7fed41fa3a41a4192dd4846a104a>;<SID=010500000000000515000000c5036a281ea106a85f2269a159040000>;CN=test,CN=Users,DC=WINDOMAIN,DC=LOCAL

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