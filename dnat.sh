#!/bin/bash

PORT=8123
INTERFACE=eth0
SS_ADDR=172.17.0.2

while [[ $# > 1 ]]
do
key="$1"

case $key in
    -p|--port)
    PORT="$2"
    shift 
    ;;
    -i|--interface)
    INTERFACE="$2"
    shift 
    ;;
    -a|--docker-address)
    SS_ADDR="$2"
    shift 
    ;;
    *)
    ;;
esac

shift 
done

iptables -t nat -A PREROUTING -p tcp --dport $PORT -i $INTERFACE -j DNAT --to $SS_ADDR:8123

