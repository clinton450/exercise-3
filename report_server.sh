#!/bin/bash

date
 
echo  "uptime  :"

uptime

echo "Currently connected :"

w
 echo "_______________________________"

echo "last logins :"

last -a   | head -3

echo  "_______________________________"

echo "Disk and memory usage : "

df -h | xargs | awk 'NR==2 {print "Free/total disk : " $11 " / " $9}'

free -m  | xargs |awk 'NR==2 {print "Free/total memory : " $17 " / " $8 " MB "}'

echo "_______________________________"

start_log=$(head -1 /var/log/messages | cut -c 1-12)


omm=$(grep -ci kill /var/log/messages)

echo -n "OOM errors since $start_log :  $oom "

echo ""

echo "_______________________________"

echo  "utilisation and most expensive processes :"

top -b |head -3
echo 

top -b | head -10 | tail -4

echo "_____________________________________"

echo "opened tcp ports :"

nmap -T4 127.0.0.1

echo "___________________________________________"

echo "current connections :"

ss -s  
echo "processes :"


ps auxf --width=200

echo "______________________________________________"

echo "vmstat :"

vmstat 1 5



























