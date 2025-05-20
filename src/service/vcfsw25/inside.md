# Inside Plant

The equipment in the SneakyNet CO wil comprise mostly the equipment
listed earlier in this document, as well as a selection of telephones.

```d2

tdm_core : TDM Core
office : SneakyNet Office PBX
ts_ext : Terminal Services
net_a : Network 'A'
atc : ATC Wirecenter

net_a -> tdm_core : Ethernet
net_a -> office : Ethernet
tdm_core -> ts_ext : Ethernet

tdm_core -> ts_ext : T1
tdm_core -> office : T1
tdm_core -> atc : T1
```

The Terminal Services equipment is broadly an extension of the TDM
Core rack.  The TDM core includes all the switching, routing and
network capability.
