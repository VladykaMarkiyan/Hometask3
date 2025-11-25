#!/bin/bash

logfile="/var/log/sysinfo"

echo "----------------------------" >> $logfile
echo "Date & Time: $(date)" >> $logfile

echo "System uptime and users:" >> $logfile
w >> $logfile 2>&1

echo "Memory usage:" >> $logfile
free -m >> $logfile 2>&1

echo "Disk usage:" >> $logfile
df -h >> $logfile 2>&1

echo "Open TCP/UDP ports:" >> $logfile
ss -tulpn >> $logfile 2>&1

echo "Ping ukr.net:" >> $logfile
ping -c1 -w1 ukr.net >> $logfile 2>&1

echo "SUID programs:" >> $logfile
find / -perm -4000 2>/dev/null >> $logfile

echo "----------------------------" >> $logfile
