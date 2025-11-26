#!/bin/bash

yum install -y cronie
systemctl enable crond
systemctl start crond


touch /var/log/sysinfo
chmod 666 /var/log/sysinfo

cat << 'EOF' > /root/sysinfo.sh

logfile="/var/log/sysinfo"
{
echo "----------------------------"
echo "Date: $(date)"
echo
echo "Uptime, users and load:"
w
echo
echo "Memory usage:"
free -m
echo
echo "Disk usage:"
df -h
echo
echo "Open TCP ports:"
ss -tulpn
echo
echo "Ping ukr.net:"
ping -c1 -w1 ukr.net
echo
echo "SUID programs:"
find / -perm -4000 -type f 2>/dev/null
} >> "$logfile"
EOF

chmod +x /root/sysinfo.sh

echo "* * * * 1-5 root /root/sysinfo.sh" >> /etc/crontab
