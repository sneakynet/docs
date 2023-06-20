What is SneakyNet?
==================

SneakyNet is a pretend ISP that shows up at events like this one to
supply retro networking, or just networking that's interesting.  The
main SneakyNet network has 2 major divisions are described below.  You
can click on the icons to learn more about the individual hardware.

TDM Circuit Switched Network
----------------------------

The circuit switched network is, as the name implies, switched over
continuously allocated circuits.  At the heart of the network is a
Cisco 2811 Integrated Services Router.

```d2
ISR : Cisco ISR {
  link: /equipment/isr.md
  icon: https://icons.terrastruct.com/infra%2F019-network.svg
}
Dialfire : Patton Electronics Dialfire { 
  link: /equipment/dialfire.md
  icon: https://icons.terrastruct.com/essentials%2F112-server.svg
}
Zhone : Zhone Channel Bank { 
  link: /equipment/zhone.md 
  icon: https://icons.terrastruct.com/infra%2F013-transfer.svg
}
Adit : Adit Channel Bank { 
  link: /equipment/adit.md 
  icon: https://icons.terrastruct.com/infra%2F013-transfer.svg
}
  
ISR <-> Dialfire : T1 PRI
ISR <-> Zhone : CAS T1
ISR <-> Adit : CAS T1
```

IP Packet Data Network
----------------------

The IP packet network is a modern-ish packet data network supporting
Internet Protocol (IP) as well as other more exotic protocols.  At the
heart of the network is a Cisco 2811 Integrated Services Router,
though most services are hosted on a dedicated x86 server.
Connectivity is achieved through a managed HP Ethernet Switch.

```d2
ISR : Cisco ISR {
  link: /equipment/isr.md
  icon: https://icons.terrastruct.com/infra%2F019-network.svg
}
EtherSwitch : HP Ethernet Switch { 
  link: /equipment/etherswitch.md
  icon: https://icons.terrastruct.com/infra%2F014-network.svg
}
Server : Services Host {
  link: /equipment/server.md
  icon: https://icons.terrastruct.com/tech%2F022-server.svg
}
Internet : Internet {
  link: /equipment/internet.md
  icon: https://icons.terrastruct.com/essentials%2F140-internet.svg
}

Internet <-> EtherSwitch : Ethernet
ISR <-> EtherSwitch : LACP
Server <-> EtherSwitch : Ethernet
```

The entire network is self contained, and hosts all services
consistent with what an ISP in the late 1990's to early 2000's would
have provided.  Not the level of a major ISP like AOL, but a smaller
one with a questionable business model.
