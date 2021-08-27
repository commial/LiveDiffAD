from argparse import ArgumentParser

parser = ArgumentParser("Attribute ID conversion")
parser.add_argument("--attid", help="Attribute ID in the replication metadata (ex: 1234, 0x20001)", type=lambda x: int(x, 0))
parser.add_argument("--oid", help="Attribute OID (ex: 1.2.840.113556.1.2.281)")
options = parser.parse_args()

if options.attid is None and options.oid is None:
    parser.print_help()
    exit(0)

# MS-DRSR, 5.16.4 ATTRTYP-to-OID Conversion
oid2id = {
    "2.5.4": 0x0,
    "2.5.6": 0x1,
    "1.2.840.113556.1.2": 0x2,
    "1.2.840.113556.1.3": 0x3,
    "2.16.840.1.101.2.2.1": 0x4,
    "2.16.840.1.101.2.2.3": 0x5,
    "2.16.840.1.101.2.1.5": 0x6,
    "2.16.840.1.101.2.1.4": 0x7,
    "2.5.5": 0x8,
    "1.2.840.113556.1.4": 0x9,
    "1.2.840.113556.1.5": 0xA,
    "0.9.2342.19200300.100": 0x13,
    "2.16.840.1.113730.3": 0x14,
    "0.9.2342.19200300.100.1": 0x15,
    "2.16.840.1.113730.3.1": 0x16,
    "1.2.840.113556.1.5.7000": 0x17,
    "2.5.21": 0x18,
    "2.5.18": 0x19,
    "2.5.20": 0x1A,
}

id2oid = {v:k for k, v in oid2id.items()}
    
if options.attid is not None:
    high_part, low_part = options.attid >> 16, options.attid & 0xFFFF
    print("%s.%s" % (id2oid[high_part], low_part))
else:
    high_part, low_part = options.oid.rsplit(".", 1)
    value = (oid2id[high_part] << 16) | int(low_part)
    print("%d (0x%x)" % (value, value))
