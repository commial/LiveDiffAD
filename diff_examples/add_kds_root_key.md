# Add a KDS root key

## Scenario

```powershell
Add-KdsRootKey -EffectiveTime ((get-date).addhours(-10))
```

## Remarks

A `-10` hours delay is used to have the KdsRootKey available right now.

## Results

```
[12/03/2021 15:23:46] CN=RID Set,CN=DC,OU=Domain Controllers,DC=windomain,DC=local

[12/03/2021 15:23:59] CN=114d69e1-f139-966c-c4e8-61a5275a42e6,CN=Master Root Keys,CN=Group Key Distribution Service,CN=Services,CN=Configuration,DC=windomain,DC=local

        msKds-CreateTime: 132830186380230000
        msKds-UseStartTime: 132829826379918307
        msKds-DomainID: CN=DC,OU=Domain Controllers,DC=windomain,DC=local
        msKds-Version: 1
        msKds-RootKeyData: 15 14 244 231 216 245 203 254 108 239 131 68 73 108 128 127 5 219 150 227 231 182 71 114 42 156 9 89 195 113 8 138 135 45 30 87 49 21 127 149 170 238 128 13 84 220 254 11 80 108 241 77 123 150 242 42 99 230 168 184 86 248 224 163
        msKds-PrivateKeyLength: 512
        msKds-PublicKeyLength: 2048
        msKds-SecretAgreementParam: 12 2 0 0 68 72 80 77 0 1 0 0 135 168 230 29 180 182 102 60 255 187 209 156 101 25 89 153 140 238 246 8 102 13 208 242 93 44 238 212 67 94 59 0 224 13 248 241 214 25 87 212 250 247 223 69 97 178 170 48 22 195 217 17 52 9 111 170 59 244 41 109 131 14 154 124 32 158 12 100 151 81 122 189 90 138 157 48 107 207 103 237 145 249 230 114 91 71 88 192 34 224 177 239 66 117 191 123 108 91 252 17 212 95 144 136 185 65 245 78 177 229 155 184 188 57 160 191 18 48 127 92 79 219 112 197 129 178 63 118 182 58 202 225 202 166 183 144 45 82 82 103 53 72 138 14 241 60 109 154 81 191 164 171 58 216 52 119 150 82 77 142 246 161 103 181 164 24 37 217 103 225 68 229 20 5 100 37 28 202 203 131 230 180 134 246 179 202 63 121 113 80 96 38 192 184 87 246 137 150 40 86 222 212 1 10 189 11 230 33 195 163 150 10 84 231 16 195 117 242 99 117 215 1 65 3 164 181 67 48 193 152 175 18 97 22 210 39 110 17 113 95 105 56 119 250 215 239 9 202 219 9 74 233 30 26 21 151 63 179 44 155 115 19 77 11 46 119 80 102 96 237 189 72 76 167 177 143 33 239 32 84 7 244 121 58 26 11 161 37 16 219 193 80 119 190 70 63 255 79 237 74 172 11 181 85 190 58 108 27 12 107 71 177 188 55 115 191 126 140 111 98 144 18 40 248 194 140 187 24 165 90 227 19 65 0 10 101 1 150 249 49 199 122 87 242 221 244 99 229 233 236 20 75 119 125 230 42 170 184 168 98 138 195 118 210 130 214 237 56 100 230 121 130 66 142 188 131 29 20 52 143 111 47 145 147 181 4 90 242 118 113 100 225 223 201 103 193 251 63 46 85 164 189 27 255 232 59 156 128 208 82 185 133 209 130 234 10 219 42 59 115 19 211 254 20 200 72 75 30 5 37 136 185 183 210 187 210 223 1 97 153 236 208 110 21 87 205 9 21 179 53 59 187 100 224 236 55 127 208 40 55 13 249 43 82 199 137 20 40 205 198 126 182 24 75 82 61 29 178 70 195 47 99 7 132 144 240 14 248 214 71 209 72 212 121 84 81 94 35 39 207 239 152 197 130 102 75 76 15 108 196 22 89
        msKds-SecretAgreementAlgorithmID: DH
        msKds-KDFParam: 0 0 0 0 1 0 0 0 14 0 0 0 0 0 0 0 83 0 72 0 65 0 53 0 49 0 50 0 0 0
        msKds-KDFAlgorithmID: SP800_108_CTR_HMAC
        objectCategory: CN=ms-Kds-Prov-RootKey,CN=Schema,CN=Configuration,DC=windomain,DC=local
        name: 114d69e1-f139-966c-c4e8-61a5275a42e6
        nTSecurityDescriptor: O:S-1-5-21-438980702-1619239835-3961497941-519G:S-1-5-21-438980702-1619239835-3961497941-519D:PAI(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)
        showInAdvancedViewOnly: True
        whenCreated: 12/03/2021 15:23:58
        instanceType: 4
        cn: 114d69e1-f139-966c-c4e8-61a5275a42e6
        objectClass: msKds-ProvRootKey
[Summary - DC=windomain,DC=local]
Using cookie from file cookie.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

No Changes

New cookie written to file cookie.bin (108 bytes)



[Summary - CN=Configuration,DC=windomain,DC=local]
Using cookie from file cookie-config.bin (108 bytes)

==== SOURCE DSA: DC.WINDOMAIN.LOCAL ====

Objects returned: 1

(0) add CN=114d69e1-f139-966c-c4e8-61a5275a42e6,CN=Master Root Keys,CN=Group Key Distribution Service,CN=Services,CN=Configuration,DC=windomain,DC=local

    1> parentGUID: 3f4f8314-3261-4958-a7ff-e46d1102b246

    1> objectGUID: 8f757181-34f4-457b-b57c-f3a9b33f9599

    2> objectClass: top; msKds-ProvRootKey

    1> instanceType: 0x4 = ( WRITE )

    1> whenCreated: 12/3/2021 3:23:58 PM Coordinated Universal Time

    1> showInAdvancedViewOnly: TRUE

    1> nTSecurityDescriptor: O:S-1-5-21-438980702-1619239835-3961497941-519G:S-1-5-21-438980702-1619239835-3961497941-519D:PAI(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;DA)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-438980702-1619239835-3961497941-519)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)

    1> name: 114d69e1-f139-966c-c4e8-61a5275a42e6

    1> objectCategory: <GUID=577a4afd571f1f49aea47e435c2f5772>;CN=ms-Kds-Prov-RootKey,CN=Schema,CN=Configuration,DC=windomain,DC=local

    0> msKds-KDFAlgorithmID:

    0> msKds-KDFParam:

    0> msKds-SecretAgreementAlgorithmID:

    0> msKds-SecretAgreementParam:

    0> msKds-PublicKeyLength:

    0> msKds-PrivateKeyLength:

    0> msKds-RootKeyData:

    0> msKds-Version:

    0> msKds-DomainID:

    0> msKds-UseStartTime:

    0> msKds-CreateTime:

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