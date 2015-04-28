#!/bin/bash
#cat ips.txt | xargs -0 bash quickNmap.sh 
nmap -sS -O $1 -p1-1200,8000-8100,8443,3389,1521,1524,7775-7779,8888,7001,7002 -oA output.txt

