#!/bin/bash

#Variables

IP=$1
firstport=$2
lastport=$3

function portscan

{
for ((counter=$firstport; counter<=$lastport; counter++)); do

	timeout 0.1 bash -c "</dev/tcp/$IP/$counter" > /dev/null 2>&1 && echo "[$IP] --> port [$counter] is OPEN"
	
done
}


portscan
