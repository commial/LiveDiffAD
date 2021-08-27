# ipconfig /registerdns

## Scenario

Run `ipconfig /registerdns` from `DC` with the following IP configuration:

```
Windows IP Configuration


Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : 
   Link-local IPv6 Address . . . . . : fe80::e50d:8296:6fdb:8fe2%4
   IPv4 Address. . . . . . . . . . . : 192.168.38.50
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 192.168.38.1
```

## Remarks

From [MS-DNSP 2.3.2.2 dnsRecord](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-dnsp/6912b338-5472-4f59-b912-0edb536b6ed8), we can parse the new `dnsRecord` entry as:

```ini
DataLength = 4
Type = 1 # type A
Version = 5 # must be 5
Rank = 240 # RANK_ZONE: The record comes from an authoritative zone
Flags = 0 # must be 0
Serial = 49
TtlSeconds = 1200 # 20 minutes
Reserved = 0 # must be 0
TimeStamp = 0
Data = "192.168.38.50" # A record
```

## Results

```
[08/27/2021 09:29:18] DC=dc,DC=WINDOMAIN.LOCAL,CN=MicrosoftDNS,DC=DomainDnsZones,DC=WINDOMAIN,DC=LOCAL

	dnsRecord: 4 0 1 0 5 240 0 0 49 0 0 0 0 0 4 176 0 0 0 0 0 0 0 0 192 168 38 50
[Summary - DC=WINDOMAIN,DC=LOCAL]
Using cookie from file cookie.bin (132 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

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

Objects returned: 1

(0) modify DC=dc,DC=WINDOMAIN.LOCAL,CN=MicrosoftDNS,DC=DomainDnsZones,DC=WINDOMAIN,DC=LOCAL

    1> objectGUID: 1e4b5809-c5c0-4622-b608-0111dc12fe22

    1> instanceType: 0x4 = ( WRITE )

    1> dnsRecord: <28 byte blob>

New cookie written to file cookie-domaindns.bin (108 bytes)
```