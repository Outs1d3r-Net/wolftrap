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


### TIP:   
```
Configure a cron job for start with system or whenever interrupted.
