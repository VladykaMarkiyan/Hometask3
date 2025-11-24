#!/bin/bash

LOGFILE="/var/log/sysinfo"

echo "------ $(date) ------" >> $LOGFILE

echo "Uptime, logged-in users, CPU load:" >> $LOGFILE
w >> $LOGFILE

echo "Memory usage:" >> $LOGFILE
free -m >> $LOGFILE

echo "Disk usage:" >> $LOGFILE
df -h >> $LOGFILE

echo "Open TCP ports:" >> $LOGFILE
ss -tulpn >> $LOGFILE

echo "Ping ukr.net:" >> $LOGFILE
ping -c1 -w1 ukr.net >> $LOGFILE 2>&1

echo "SUID programs:" >> $LOGFILE
find / -type f -perm -4000 2>/dev/null >> $LOGFILE

echo "----------------------------" >> $LOGFILE
