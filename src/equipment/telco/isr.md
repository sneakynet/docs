# Cisco ISR

The Cisco Integrated Services Router (ISR) is a 1U platform designed
for dense routing applications where size matters.  This chassis was
originally designed as a branch office router and was introduced to
the Cisco product line around 2004.  The hardware reached end-of-life in
2011 and passed end-of-service-life in 2016 per Cisco's listed
policies.

The 2811 is used in the SneakyNet system to provide both IP data
services as well as to serve as the TDM switch at the Telco end of the
connection.  The router contains multiple T1 interface cards, and has
an LACP bonded connection to the ethernet switch, which allows for
traffic flows at a maximum of 200Mbit/s.

The 2811 provides the network clock for the T1 connections which are
synchronous serial links.  The clock on the 2811 is allowed to
free-run relative to network time, however proper ISPs make use of
extremely high precision clocks to maintain a precise lock against the
long distance network's clock.  The IP throughput capabilities of the
2811 chassis are laughable by today's standards, but would have been
fairly impressive when it launched.  While not in use by SneakyNet,
the 2800 series routers support Cisco's proprietary DC feed standard
for a secondary power supply, which would have enabled the router to
consume power from either a standard AC bus or from a variety of
secondary sources in the event of a mains power failure.
