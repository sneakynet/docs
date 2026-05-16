# Outside Plant

The outside plant includes substantial network capability distributed
between two wirecenters.  Each exhibit hall is one wircenter and
contains central infrastructure as well as distribution cabling.  The
wirecenters are linked in a centra/remote architecture, with the
remote being fed by 1 T1 circuit and a 1000BaseSX circuit.

Using the advanced capabilities of the [Shady Rate
Interface](http://www.dms-100.net/telephony/general/shady-rate-interface/),
some exhibitor circuits "loop through" other customer premises.  These
circuits are on existing trunk infrastructure, but are not present on
the interface equipment at these customer sites.

## Wirecenter - TRNTY

The TRNTY wirecenter services the main hall and immediately adjacent
spaces such as show registration.

```d2
co : Central Office

# Trunk Line 1
petar : |md
  Name: Petar's Place
  ---
  Table: 97,98,99,100

  Service:
  * 1:1 - Analog POTS (x7013)
  * 1:2 - Analog POTS (x7014)
|
petar.shape: rectangle

co -> petar : Trunk 1 (50 feet)

# Trunk Line 2
ibmrt : |md
  Name: IBM RT PC
  ---
  Table: 146,147,148

  Service:
  * 2:1 - Analog POTS (x7004)
  * 2:2 - Analog POTS (x7005)
|
ibmrt.shape: rectangle

aj : |md
  Name: Forgotten Machines
  ---
  Table: 130,131,132,133,149

  Service:
  * 2:3 - Analog POTS (x7002)
  * 2:4 - Analog POTS (x7003)
|
aj.shape: rectangle

co -> ibmrt : Trunk 2 (65 feet)
ibmrt -> aj : Trunk 2 (50 feet)

# Trunk Line 3
donut : |md
  Name: Donut's Hole in the Wall
  ---
  Table: 136

  Service:
  * 3:1 - Analog POTS (x7011)
  * 3:2 - Analog POTS (x7012)
|
donut.shape: rectangle

alexandwill : |md
  Name: Alex and Will
  ---
  Table: 138,139,140,141,142,143,144

  Service:
  * 3:3 - Analog POTS (x7006)
  * 3:4 - Analog POTS (x7007)
|
alexandwill.shape: rectangle

co -> donut : Trunk 3 (75 feet)
donut -> alexandwill : Trunk 3 (50 feet)

# Trunk 4
techav : |md
  Name: TechAV
  ---
  Table: 17

  Service:
  * 4:1 - Analog POTS (x7000)
|
techav.shape: rectangle

midrange_unix : |md
  Name: Midrange UNIX Machines
  ---
  Table: 19,20

  Service:
  * 4:2 - Analog POTS (x7001)
|
midrange_unix.shape: rectangle

co -> techav : Trunk 4 (75 feet)
techav -> midrange_unix : Trunk 4 (50 feet)

# Trunk 5
alive : |md
  Name: It's Alive
  ---
  Table: 26

  Service:
  * 5:1 - Analog POTS (x7008)
  * 5:2/3 - TDM PRI
|
alive.shape: rectangle

co -> alive : Trunk 5 (75 feet)

# Trunk 6
ibm3270 : |md
  Name: IBM 3270 Terminals
  ---
  Table: 102

  Service:
  * 6:1 - Analog POTS (x7015)
  * 6:2/3 - TDM PRI
|
ibm3270.shape: rectangle

co -> ibm3270 : Trunk 6 (30 feet)

# Trunk 7
adventure: |md
  Name: Adventures in Vintage Computing
  ---
  Table: 33

  Service:
  * 7:1 - Analog POTS (x7009)
  * 7:2 - Analog POTS (x7010)
|
adventure.shape: rectangle

nerds: |md
  Name: Meddling Nerds
  ---
  Table: 35,36

  Service:
  * 7:3 - Analog POTS (x7016)
  * 7:4 - Analog POTS (x7017)
|
nerds.shape: rectangle

co -> adventure : Trunk 7 (100 feet)
adventure -> nerds : Trunk 7 (50 feet)

# Trunk 8
pz1: |md
  Name: Phone Zoo (Bank 1)
  ---
  Table: CO

  Service:
  * 8:1 - Analog POTS (x7030)
  * 8:2 - Analog POTS (x7031)
  * 8:3 - Analog POTS (x7032)
  * 8:4 - Analog POTS (x7033)
|
pz1.shape: rectangle

co -> pz1 : Trunk 8 (20 feet)

# Trunk 9
pz2: |md
  Name: Phone Zoo (Bank 2)
  ---
  Table: CO

  Service:
  * 9:1 - Analog POTS (x7034)
  * 9:2 - Analog POTS (x7035)
  * 9:3 - Analog POTS (x7036)
  * 9:4 - Analog POTS (x7037)
|
pz2.shape: rectangle

co -> pz2 : Trunk 9 (20 feet)

# Trunk Line 10
wc_oak : |md
  Wirecenter: OAK
  ---
  Service:
  * T1 - Customer INTERNAL
|
wc_oak.shape: hexagon

co -> wc_oak : Trunk 10 (300 feet)

```

## Wirecenter - OAK

The OAK wirecenter is a rural market with very few customers.

```d2
co : Central Office {
  shape: hexagon
}

oak : |md
  Oak Channel Bank
  ---
  Fed From CO
|
oak.shape : rectangle

co -> oak

# Trunk 1
romberg : |md
  Name: Mark Romberg
  ---
  Table: 225

  Service:
  * 1:1 - Analog POTS (x7048)
|
romberg.shape: rectangle

oak -> romberg : Trunk 1 (75 feet)

```
