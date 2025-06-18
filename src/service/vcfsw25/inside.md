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

External jumpers are as follows:

```d2

stc : SneakyNet TDM Core {
    pp : Patch Panel {
        ge0/1
        0/1/0
        0/2/1
        fe2/8
        fe2/9
    }
}

sta: SneakyNet TDM Adjunct {
    ts : Terminal Services {
        eth0
    }

    mpool : AS5300 {
        fe0
        0/0
    }
}

sno : SneakyNet Offic Phones {
    bcm : BCM {
        dtm : DTM
    }

    srx : SRX {
        0/1
    }
}

net : NET-A {
    ccr : CCR {
        sfp1
        sfp3
        sfp4
    }

    sw0 : Switch0 {
        22 : P22 (AP)
        20 : P20 (Stargate)
        18 : P18 (Peer)
        17 : P17 (Peer)
        16 : P16 (Printer)
        15 : P15 (UPS)
        14 : P14 (Peer)
    }
}

dgac_annex1 : DGAC Unix Room

atc : ATC {
    shape: hexagon
}

sg0 : Stargate {
    icon: https://icons.terrastruct.com/infra%2F010-data-sharing.svg
}

ap0 : Root AP {
    icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
}

utd_wan : UTD WAN {
    icon: https://icons.terrastruct.com/azure%2FNetworking%20Service%20Color%2FVirtual%20WANs.svg
}

lp0 : Printer

ups0 : UPS {
    icon: https://icons.terrastruct.com/tech%2Fpower.svg
}

minitel : MiniTel

net.ccr.sfp1 -> utd_wan
net.ccr.sfp3 -> atc
net.ccr.sfp4 -> dgac_annex1

net.sw0.22 -> ap0
net.sw0.20 -> sg0
net.sw0.18 -> stc.pp.ge0/1
net.sw0.17 -> sno.srx.0/1
net.sw0.16 -> lp0
net.sw0.15 -> ups0
net.sw0.14 -> minitel
stc.pp.0/1/0 -> sno.bcm.dtm
stc.pp.0/2/1 -> sta.mpool.0/0
stc.pp.fe2/8 -> sta.mpool.fe0
stc.pp.fe2/9 -> sta.ts.eth0
```
