# Wolf Trap  
> Based on Beartrap from PaulDotCom   
#  

## Requeriments:  
* iptables  
* netcat  

**Obs:** Install ncat or netcat so remember to change ```line 10``` of the script.   
```
ninjafrog@myobuko:~$ sudo apt install iptables ncat -y
```
## List all block IP's:  
```
ninjafrog@myobuko:~$ iptables -L -n
```
## Unblock IP's:  
```
ninjafrog@myobuko:~$ iptables -D INPUT -p tcp -s $IP -j DROP
```
## Running:   
```
ninjafrog@myobuko:~$ screen bash wolftrap.sh

<PRESS CRTL+A+D for background>
```
```
ninjafrog@myobuko:~$ screen -ls
```
```
ninjafrog@myobuko:~$ screen -r <ID>
```
# wolftrap.sh:  
```bash
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
```



### TIP:   
```
Configure a cron job for start with system or whenever interrupted.
