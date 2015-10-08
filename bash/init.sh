#!/bin/bash
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t filter -A FORWARD -s 192.168.122.0/24 -o eth0 -j REJECT
iptables -t filter -A FORWARD -s 192.168.122.0/24 -d 119.29.29.29/32 -j ACCEPT
iptables -t nat -A PREROUTING -s 192.168.122.0/24 -p tcp -j DNAT --to 192.168.122.4
