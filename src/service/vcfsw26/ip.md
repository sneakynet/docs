# IP Services

IP services are provided on a very limited basis for exhibitors and
primarily via wireless connections.  The network core is an HPE 2530
with a remote HPE 2530 as an IDF, all leaf switches are Ruckus
ICX7150-C12P.

Connections are as shown below:

```d2
co : Central Office {
    tmo_wan : T-Mobile WAN {
        icon: https://icons.terrastruct.com/azure%2FNetworking%20Service%20Color%2FVirtual%20WANs.svg
    }

    wall : Workstation Wall {
        DAC+ : AOC Tail
    }

    ccr : Mikrotik CCR2004 {
        sfp1
        sfp3
        sfp4
        sfp5
        sfp11
        sfp12
    }

    hp2530 : HP Switch {
        25
        26
    }

    trnty : Trinity Ballroom {
        aruba01 : Aruba01 {
            icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
        }
        aruba02 : Aruba02 {
            icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
        }
        aruba03 : Aruba03 {
            icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
        }
        aruba04 : Aruba04 {
            icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
        }
    }

    ups0 : UPS {
        icon: https://icons.terrastruct.com/tech%2Fpower.svg
    }

    aruba00 : Aruba00 {
        icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
    }

    sg0 : Stargate {
        icon: https://icons.terrastruct.com/infra%2F010-data-sharing.svg
    }

    ccr.sfp1 -> tmo_wan : Ethernet
    ccr.sfp3 -> wall.DAC+ : AoC
    ccr.sfp11 -> hp2530.25 : DAC+
    ccr.sfp12 -> hp2530.26 : DAC+
    hp2530.9 -> trnty.aruba01 : Ethernet
    hp2530.10 -> trnty.aruba02 : Ethernet
    hp2530.11 -> trnty.aruba03 : Ethernet
    hp2530.12 -> trnty.aruba04 : Ethernet
    hp2530.15 -> ups0 : Ethernet
    hp2530.16 -> aruba00 : Ethernet
    hp2530.20 -> sg0 : Ethernet

}

classroom_block : Classroom Block {
    maple : Maple (Show Office) {
        idf0 {
            1
            2
            3
            25
            26
            27
        }
        aruba06: Aruba06 {
            icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
        }
        phone : Staff Phone {
            icon: https://icons.terrastruct.com/tech%2F052-smartphone-3.svg
        }

        idf0.1 -> aruba06
        idf0.2 -> phone

    }
    elm : Elm (Computer Lab) {
        aruba07: Aruba07 {
            icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
        }
    }
    maple.idf0.3 -> elm.aruba07
}
co.ccr.sfp5 -> classroom_block.maple.idf0.25 : 1000BaseSX

theater : NMC2 Theater {
    icx01 {
        1/2/11
        1/2/12
        1/3/1
    }
    phone : Staff Phone {
        icon: https://icons.terrastruct.com/tech%2F052-smartphone-3.svg
    }
    aruba08: Aruba08 {
        icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
    }

    icx01.1/2/11 -> phone
    icx01.1/2/12 -> aruba08
}
classroom_block.maple.idf0.26 -> theater.icx01.1/3/1 : 1000BaseSX

regdesk : Registration Desk {
    icx02 {
        1/2/11
        1/2/12
        1/3/1
    }
    phone : Staff Phone {
        icon: https://icons.terrastruct.com/tech%2F052-smartphone-3.svg
    }
    aruba09: Aruba09 {
        icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
    }

    icx02.1/2/11 -> phone
    icx02.1/2/12 -> aruba09
}
classroom_block.maple.idf0.27 -> regdesk.icx02.1/3/1 : 1000BaseSX

oak : OAK {
  icx00 : icx00 {
    1/2/12
    1/3/1
    1/3/2
  }

  aruba05: Aruba05 {
      icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
  }
  icx00.1/2/12 -> aruba05
}
co.ccr.sfp4 -> oak.icx00.1/3/1 : 1000BaseSX

shop : Consignment Shop {
    icx03 {
        1/2/11
        1/2/12
        1/3/1
    }
    phone : Staff Phone {
        icon: https://icons.terrastruct.com/tech%2F052-smartphone-3.svg
    }
    aruba10: Aruba10 {
        icon: https://icons.terrastruct.com/essentials%2F104-wifi.svg
    }

    icx03.1/2/11 -> phone
    icx03.1/2/12 -> aruba10
}
oak.icx00.1/3/2 -> shop.icx03.1/3/1

```
