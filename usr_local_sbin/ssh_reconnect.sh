#!/bin/bash

# usage:
# /etc/crontab
# */2 * * * * root /usr/local/sbin/ssh_reconnect.sh 1>&2> /dev/null

# IP or domain name
oppositeIP="a.y.to"
oppositeTunnelIP="1.11.1.8"
tunnel="-w0:0"

echo "testing ping ..."
ping -c 3 $oppositeTunnelIP 2>/dev/null 1>/dev/null

if [ $? -eq 0  ];then
    echo "ssh is already connected and stable!"
else
    ssh  -fCN $tunnel $oppositeIP
    echo "`date` $oppositeIP, ssh tunnel is restarted and reconnected" >> /var/log/ssh_reconnect.log
fi

