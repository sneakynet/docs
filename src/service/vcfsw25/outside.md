# Outside Plant

The outside plant includes substantial network capability distributed
between two wirecenters.  Each exhibit hall is one wircenter and
contains central infrastructure as well as distribution cabling.  The
wirecenters are linked in a centra/remote architecture, with the
remote being fed by 2 T1 circuits and a 1000BaseSX circuit.

Using the advanced capabilities of the Shady Rate Interface, some
exhibitor circuits "loop through" other customer premises.  These
circuits are on existing trunk infrastructure, but are not present on
the interface equipment at these customer sites.

## Wirecenter - GNDY

The GNDY wirecenter services the main hall, and two smaller breakout
rooms.  The MDCON space is not within the SneakyNet coverage area.

```d2
co : Central Office

# Trunk Line 1
petar : |md
  Name: Petar's Place
  ---
  Table: 8,9,10,11

  Service:
  * 1:1 - Analog POTS
  * 1:2 - Analog POTS
|
petar.shape: rectangle

kyle : |md
Name: Kyle
  ---
  Table: 31,32,33

  Service:
  * 1:3 - Analog POTS
  * 1:4 - Nortel Digital
  |
kyle.shape: rectangle

co -> petar : Trunk 1 (XXX feet)
petar -> kyle : Trunk 1 (XXX feet)

# Trunk Line 2
nybbles : |md
Name: Nybbles and Bytes
---
Table: 12,13,14

Service:
* 2:1 - Analog POTS
|
nybbles.shape: rectangle

will : |md
Name: Will Tooker
---
Table: 43,44,45

Service:
* 2:2 - Analog POTS
* 2:3 - Analog POTS
|
will.shape: rectangle

co -> nybbles : Trunk 2 (XXX Feet)
nybbles -> will : Trunk 2 (XXX Feet)

# Trunk Line 3
ibmrt : |md
Name: IBM RT PC
---
Table: 16,17

Service:
* 3:2 - Analog POTS
|
ibmrt.shape: rectangle

co -> ibmrt : Trunk 3 (XXXX feet)

# Trunk Line 4
forgotten_machines : |md
Name: Forgotten Machines
---
Table: 84,85,86,87,88

Service:
* 4:1 - Analog POTS
* 4:2 - Analog POTS
|
forgotten_machines.shape: rectangle

kitchen_sink : |md
Name: The Kitchen Sink
---
Table: 22,23,24

Service:
* 4:3 - Analog POTS
|
kitchen_sink.shape: rectangle

co -> forgotten_machines : Trunk 4 (XXXX feet)
forgotten_machines -> kitchen_sink : Trunk 4 (XXXX feet)

# Trunk Line 5
techav : |md
Name: TechAV
---
Table: 25,26

Service:
* 5:1 - Analog POTS
* 5:2 - Analog POTS
|
techav.shape: rectangle

regdesk : |md
Name: Registration Desk
---
Table: Registration (Lobby)

Service:
* 5:3 - Analog POTS
|
regdesk.shape: rectangle

co -> techav : Trunk 5 (XXXX feet)
techav -> regdesk : Trunk 5 (XXXX feet)

# Trunk Line 6
genericable : |md
Genericable
---
Table: 5

Service
* 6:2 - POTS (0/0/0:15)
* 6:3 - POTS (0/0/0:19)
|
genericable.shape: rectangle

mesalanius : |md
Name: Team Mesalanius
---
Table: 122

Service:
* 6:1 - Analog POTS
|
mesalanius.shape: rectangle

co -> genericable : Trunk 6 (XXXX Feet)
genericable -> mesalanius : Trunk 6 (XXXX Feet)

# Trunk Line 7
forgotten_it : |md
Name: The Forgotten IT Closet
---
Table: 137,138,139

Services:
* 7:1 - Analog POTS
|
forgotten_it.shape: rectangle

co -> forgotten_it : Trunk 7 (300 Feet)

# Trunk Line 8
fruitchannel: |md
Name: Fruitchannel
---
Table: 144,145

Service:
* 8:1 - Analog POTS
* 8:2 - Analog POTS
|
fruitchannel.shape: rectangle

next : |md
Name: NeXT Computers
---
Table: 146,147

Service:
* 8:3 - Analog POTS
* 8:4 - Analog POTS
|
next.shape: rectangle

co -> fruitchannel : Trunk 8 (300 Feet)
fruitchannel -> next : Trunk 8 (30 Feet)

# Trunk Line 9
phonezoo1: |md
SneakyNet - Phone Zoo (Left)
---
Table 55

Service:
* 9:1 - Analog POTS
* 9:2 - Analog POTS
* 9:3 - Analog POTS
* 9:4 - Analog POTS
|
phonezoo1.shape: rectangle

phonezoo2: |md
SneakyNet - Phone Zoo (Right)
---
Table 57

Service:
* 9:1 - Analog POTS
* 9:2 - Analog POTS
* 9:3 - Analog POTS
* 9:4 - Analog POTS
|
phonezoo2.shape: rectangle

co -> phonezoo1 : Trunk 9 (10 Feet)
phonezoo1 -> phonezoo2 : Trunk 9 (30 Feet)

# Trunk Line 10
wc_atc : |md
Wirecenter: ATC
---
Service:
* T1 - Customer INTERNAL
* T1 - Customer M-A-L
|
wc_atc.shape: hexagon

co -> wc_atc : Trunk 10 (600 Feet)
```

## Wirecenter - ATC

The ATC wirecenter covers the ATC building, as well as the Media
Archeology Lab's remote footprint.

```d2
co : Central Office {
  shape: hexagon
}

atc : |md
ATC Channel Bank
---
Fed From CO
|
atc.shape: rectangle

co -> atc

# Trunk 1
clevenger : |md
Name: Clevenger
---
Table: 212,213

Service:
* 1:1 - Analog POTS
* 1:2 - Analog POTS
|
clevenger.shape: rectangle

atc -> clevenger : Trunk 1 (75 Feet)

# Trunk 2
anachronistic : |md
Name: Anachronistic Things
---
Table: 211

Service:
2:1 - Analog POTS
|
anachronistic.shape: rectangle

owt : |md
Name: Nowt for owt
---
Table: 210

Service:
2:2 - Analog POTS
|
owt.shape: rectangle

first : |md
Name: First Family
---
Table: 209

Service:
2:3 - Analog POTS
|
first.shape: rectangle

atc -> anachronistic : Trunk 2 (75 Feet)
anachronistic -> owt : Trunk 2 (20 Feet)
owt -> first : Trunk 2 (20 Feet)

# Trunk 3
yotsubanome : |md
Name: Yotsubanome Newtorks
---
TBL: 236

* 3:1 - Analog POTS
|
yotsubanome.shape: rectangle
atc -> yotsubanome : Trunk 3 (100 Feet)

# Trunk to MAL
mal : |md
Name: Media Archeology Lab
---
Room: 1.705

Service:
* T1 to CO
|
mal.shape: rectangle

atc -> mal : Trunk 4 (300 Feet)
```
