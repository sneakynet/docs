# IP Services

Overall the IP network is presented as a large layer 2 broadcast
domain for exhibitor use.  Some exhibitors are fed from the core
switch in the CO, which is an HPE /////.  Leaf switches are all Ruckus
ICX715-C12P which provide a great balance of compact switches with
generous PoE.

The network core is a Mikrotik CCR 2004.  This is not vintage hardware
at all, but when operating large scale wifi networks and Ethernet
fabrics, I prefer to have access to modern hardware that interacts
with modern management systems.

Overall, the IP network looks like this:

```d2

utd_wan : UTD WAN {
    icon: https://icons.terrastruct.com/azure%2FNetworking%20Service%20Color%2FVirtual%20WANs.svg
}

co : Central Office {
    ccr : Mikrotik CCR2004 {
        sfp1
        sfp3
        sfp4
        sfp5
        sfp11
        sfp12
    }

    hp2530 : HP Switch {
        22
        25
        26
    }
    aruba00

    ccr.sfp11 -> hp2530.25 : DAC+
    ccr.sfp12 -> hp2530.26 : DAC+
    hp2530.22 -> aruba00 : Ethernet
}

gndy : GNDY Main {
    icx00 {
        1/2/12
        1/3/1
    }
}

gndy_annex : GNDY Annex {
    icx01 {
        1/3/1
    }
    aruba01

    icx01.1/2/12 -> aruba01 : Ethernet
}

atc : ATC {
    icx02 {
        1/2/11
        1/2/12
        1/3/1
        1/3/2
    }

    icx03 {
        1/2/12
        1/3/1
    }
    aruba02
    aruba03
    aruba04

    icx02.1/3/2 -> icx03.1/3/1 : 1000BaseSX

    icx02.1/2/11 -> aruba02 : Ethernet
    icx02.1/2/12 -> aruba03 : Ethernet
    icx03.1/2/12 -> aruba04 : Ethernet
}



co.ccr.sfp1 -> utd_wan : Ethernet MGIG
co.ccr.sfp3 -> gndy.icx00.1/3/1 : 1000BaseSX
co.ccr.sfp4 -> gndy_annex.icx01.1/3/1 : 1000BaseSX
co.ccr.sfp5 -> atc.icx02.1/3/1 : 1000BaseSX

```

Not pictured in the above diagram are the other ports on the ICX
switches, which were used to provision exhibitor facing Ethernet
ports.
