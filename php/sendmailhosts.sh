#!/bin/bash
 
line=$(head -n 1 /etc/hosts)
line2=$(echo $line | awk '{print $2}')
 
echo "$line $line2.localdomain $(hostname)" >> /etc/hosts