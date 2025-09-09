# Inside Plant

As SneakyNet is not the ILEC in the VCFMW market, our CO footprint is
extremely small.  We will only be present with IT services.

```d2
net : NET-A {
    ccr : CCR {
        sfp3
        sfp4
        sfp11
        sfp12
    }

    sw0 : Switch0 {
        26 : P26 (Trk1/1)
        25 : P25 (Trk1/0)
        22 : P22 (CME)
        20 : P20 (Stargate)
        19 : P19 (AP)
        18 : P18 (UPS)
    }

    cme00 : CME {
        ge0 : ge0/0
    }

    ccr.sfp11 -> sw0.25
    ccr.sfp12 -> sw0.26
}

idf0 : IDF 0 {
  sw1 : Switch1 {
    28 : P28 (Switch Trunk)
    24 : P24 (T-Mobile UWB)
    23 : P23 (AT&T LTE)
    22 : P22 (SkyLink PoE)
    21 : P21 (Sketchy CBRS)
  }

  tmo : T-Mobile UWB
  att : AT&T LTE
  skylink : SkyLink 802.11
  cbrs : Sketchy CBRS

  sw1.24 -> tmo
  sw1.23 -> att
  sw1.22 -> skylink
  sw1.21 -> cbrs
}

icx0 : ICX0 {
  1/3/1
}

sg0 : Stargate {
    icon: https://icons.terrastruct.com/infra%2F010-data-sharing.svg
}

ap0 : Root AP {
    icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
}

ups0 : UPS {
    icon: https://icons.terrastruct.com/tech%2Fpower.svg
}

net.ccr.sfp3 -> idf0.sw1.28
net.ccr.sfp4 -> icx0.1/3/1

net.sw0.22 -> net.cme00
net.sw0.20 -> sg0
net.sw0.19 -> ap0
net.sw0.18 -> ups0
```
