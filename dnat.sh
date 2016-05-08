#!/bin/bash

PORT=8123
INTERFACE=eth0
SS_ADDR=172.17.0.2

iptables -t nat -A PREROUTING -p tcp --dport $PORT -i $INTERFACE -j DNAT --to $SS_ADDR:8123

