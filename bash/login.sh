#!/bin/bash
iptables -t nat -D PREROUTING -s $1/32 -j ACCEPT
iptables -t nat -D PREROUTING -s $1/32 -p tcp -j ACCEPT
iptables -t filter -D FORWARD -s $1/32 -o eth0 -j ACCEPT
iptables -t nat -I PREROUTING -s $1/32 -j ACCEPT
iptables -t nat -I PREROUTING -s $1/32 -p tcp -j ACCEPT
iptables -t filter -I FORWARD -s $1/32 -o eth0 -j ACCEPT
