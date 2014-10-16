#!/bin/bash
if [ -z "$1" ]
  then
    echo "Invalid arguments. ./arpScanList.sh CIDR"
    exit 1
fi
#bar=(`echo $1|tr '.' '\n'`)
bar=(`echo $1|cut -d'.' -f1-2`)
arp-scan $1 | cut -f1 -d$'\t' | grep "$bar"
