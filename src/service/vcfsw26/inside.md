# Inside Plant

The SneakyNet CO will contain inside plant equipment as described
elsewhere in this document as well as a customer experience center
where patrons can try out a number of novel telephones and network
devices.

```d2

tdm_core : TDM Core
office : SneakyNet Office PBX
ts_ext : Terminal Services
net_a : Network 'A'
oak : Oak Wirecenter

net_a -> tdm_core : Ethernet
net_a -> office : Ethernet
tdm_core -> ts_ext : Ethernet

tdm_core -> ts_ext : T1
tdm_core -> office : T1
tdm_core -> oak : T1
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
        0/1/1
        0/2/1
        fe2/8
        fe2/9
    }
}

sta: SneakyNet TDM Adjunct {
    mpool : AS5300 {
        0/0/0
        fe0
    }

    ts : Terminal Services {
        eth0
    }
}

sno : SneakyNet Office Phones {
    bcm : BCM {
        D1
        D2
        D3
        D4

        dtm : DTM
    }

    srx : SRX {
        0/2
    }
}

net : NET-A {
    ccr : CCR {
        sfp1
        sfp3
    }

    sw0 : Switch0 {
        15 : P15 (UPS)
        16 : P16 (Aruba0)
        17 : P17 (Peer - BCM)
        18 : P18 (Peer - TDM)
        20 : P20 (Stargate)
    }

    cme00 : CME Switch {
        0/0/0
    }
}

wall : CO Work Wall {
    sri_left : SRI (Left) {
        1
        4
    }
    sri_right : SRI (Right) {
        1
        4
    }
    dac+ : AoC Tail
}

sg0 : Stargate {
    icon: https://icons.terrastruct.com/infra%2F010-data-sharing.svg
}

ap0 : Root AP {
    icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
}

tmo_wan : T-Mobile WAN {
    icon: https://icons.terrastruct.com/azure%2FNetworking%20Service%20Color%2FVirtual%20WANs.svg
}

ups0 : UPS {
    icon: https://icons.terrastruct.com/tech%2Fpower.svg
}

tmo_wan -> net.ccr.sfp1

net.sw0.15 -> ups0
net.sw0.16 -> ap0
net.sw0.17 -> sno.srx.0/2
net.sw0.18 -> stc.pp.ge0/1
net.sw0.20 -> sg0
stc.pp.0/1/0 -> sno.bcm.dtm
stc.pp.0/1/1 -> net.cme00.0/0/0
stc.pp.0/2/1 -> sta.mpool.0/0/0
stc.pp.fe2/8 -> sta.mpool.fe0
stc.pp.fe2/9 -> sta.ts.eth0
wall.sri_left.1 -> sno.bcm.D1
wall.sri_left.4 -> sno.bcm.D2
wall.sri_right.1 -> sno.bcm.D3
wall.sri_right.4 -> sno.bcm.D4
wall.dac+ -> net.ccr.sfp3
```
