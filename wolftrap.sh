#!/bin/bash

#Start honeyport
echo "Started..."

#Init loop
while true
do
    #Open port and monitoring connections
    IP=$(nc -v -l -p 2121 2>&1 1>/dev/null|grep from|awk '{print $3;}'| tr -d '[] ')

    #Show IP address and datetime event
    echo "Blocking $IP at $(date +%Y-%m-%d_%H:%M:%S)" >> /tmp/honeyport.log

    #Block IP address
    iptables -A INPUT -p tcp -s $IP -j DROP

    #Show block IP's
    # $ iptables -L -n

    #Unblock IP address
    # $ iptables -D INPUT -p tcp -s $IP -j DROP

done
