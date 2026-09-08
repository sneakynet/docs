# Outside Plant

We have considerable outside plant to cover the 100 thousand square
foot convention center.  At the high level, this plant is connected as
follows:


```d2
co : CO {
  ccr : CCR {
    sfp5
    sfp6
    sfp7
  }
}

remote : Remote Switching Complex {
  optimux1 : Optimux 1 {
    sfp1
    sfp2
    sfp3
  }
}

towerB2 : Tower B2 {
  icx00 : ICX00 {
    1/3/1
  }
}

towerB6 : Tower B6 {
  icx01 : ICX01 {
    1/3/1
  }
}

towerD2 : Tower D2 {
  icx02 : ICX02 {
    1/3/1
  }
}

towerD6 : Tower D6 {
  icx03 : ICX03 {
    1/3/1
  }
}

timing : Timing Rack {
  ts0 : TimeSwitch0 {
    28 : P28
  }
}

co.ccr.sfp5 -> remote.optimux1.sfp1 : 10GBaseSR
co.ccr.sfp6 -> towerD2.icx02.1/3/1 : 10GBaseSR
co.ccr.sfp7 -> towerD6.icx03.1/3/1 : 10GBaseSR

remote.optimux1.sfp2 -> towerB2.icx00.1/3/1 : 10GBaseSR
remote.optimux1.sfp3 -> towerB6.icx01.1/3/1 : 10GBaseSR

towerD2.icx02.1/3/2 -> timing.ts0.28 : 1GBaseSX
```

There are four tower sites around the floor.  They all have a common
pattern with sector radios, but towers B6 and D2 have special
additional equipment:

## Tower B2

```d2
remote : Remote Switching Complex {
  shape: hexagon
}

icx00 : ICX00 {
  1/1/1
  1/1/2
  1/1/3

  1/3/1
}

sector00 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

sector01 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

sector02 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

remote -> icx00.1/3/1 : 10GBaseSR

icx00.1/1/1 -> sector00 : 1GBaseT (Red)
icx00.1/1/2 -> sector01 : 1GBaseT (Blue)
icx00.1/1/3 -> sector02 : 1GBaseT (Green)
```

## Tower B6

```d2
remote : Remote Switching Complex {
  shape: hexagon
}

icx01 : ICX01 {
  1/1/1
  1/1/2
  1/1/3

  1/3/1
}

sector03 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

sector04 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

sector05 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

skynet1 : SkyNet1 {
  icon: https://icons.d2lang.com/infra%2F007-satellite.svg
}

remote -> icx01.1/3/1 : 10GBaseSR

icx01.1/1/1 -> sector03 : 1GBaseT (Red)
icx01.1/1/2 -> sector04 : 1GBaseT (Blue)
icx01.1/1/3 -> sector05 : 1GBaseT (Green)
icx01.1/1/4 -> skynet1 : 1GBaseT
```

## Tower D2

```d2
co : Central Office {
  shape: hexagon
}

icx02 : ICX02 {
  1/1/1
  1/1/2
  1/1/3

  1/3/1
  1/3/2
}

sector06 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

sector07 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

sector08 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

time : Timing {
  ts0 : TimeSwitch0 {
    1 : P1
    23 : P23
    28 : P28
  }
}

starlink : StarLink Terminal {
  icon: https://icons.d2lang.com/infra%2F007-satellite.svg
}

jeff : Jeff Geerling {
  icon: https://icons.d2lang.com/essentials%2F365-user.svg
}

co -> icx02.1/3/1 : 10GBaseSR

icx02.1/1/1 -> sector06 : 1GBaseT (Red)
icx02.1/1/2 -> sector07 : 1GBaseT (Blue)
icx02.1/1/3 -> sector08 : 1GBaseT (Green)

icx02.1/3/2 -> time.ts0.28 : 1GBaseSX
time.ts0.1 -> jeff : 1GBaseT
time.ts0.23 -> starlink : 1GBaseT
```

## Tower D6

```d2
co : Central Office {
  shape: hexagon
}

icx03 : ICX03 {
  1/1/1
  1/1/2
  1/1/3

  1/3/1
}

sector09 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

sector10 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

sector11 {
  icon: https://icons.d2lang.com/essentials%2F104-wifi.svg
}

co -> icx03.1/3/1 : 10GBaseSR

icx03.1/1/1 -> sector09 : 1GBaseT (Red)
icx03.1/1/2 -> sector10 : 1GBaseT (Blue)
icx03.1/1/3 -> sector11 : 1GBaseT (Green)
```
