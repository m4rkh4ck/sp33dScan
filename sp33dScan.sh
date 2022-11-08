#!/bin/bash
#variabili colore
RED='\033[1;31m'
YELLOW="\e[1;33m"
LGREEN="\e[1;32m"
WHITE="\e[1;37m"

#title
echo "           ____ ____      _  _____                 "
echo "          |___ \___ \    | |/ ____|                "
echo "  ___ _ __  __) |__) | __| | (___   ___ __ _ _ __  "
echo " / __| '_ \|__ <|__ < / _\` |\___ \ / __/ _\` | '_ \ "
echo " \__ \ |_) |__) |__) | (_| |____) | (_| (_| | | | |"
echo " |___/ .__/____/____/ \__,_|_____/ \___\__,_|_| |_|"
echo "     | |                                           "
echo "     |_|                                           "
echo "Discover hosts and open ports in the network (MAYBE :-)"
echo -e "${RED}""                powered by m4rkh4ck"

#script begin
echo -e "${LGREEN}"
echo "Please type the first three octets of the target network:"
echo -e "${WHITE}"


read ottetto
echo -e "${YELLOW}"
echo "Hosts alive in the network:"
echo -e "${WHITE}"

#for cycle
for ip in {1..254}; do

ping -c 1 $ottetto.$ip | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1 &
done | tee hosts.csv

echo -e "${YELLOW}"
echo "___________________________________________________________"

#port scan with portsp33d.sh
echo ""
echo "Port Scan:"
echo -e "${LGREEN}"
echo "Please type the interval of ports to scan, EXAMPLE : 1 1024 "
echo -e "${WHITE}"
read p1 p2
echo -e "${YELLOW}"
echo "___________________________________________________________"
echo -e "${WHITE}"
echo ""
while read ip; do
	./portsp33d.sh $ip $p1 $p2
done < hosts.csv | tee ports.csv

date >> ports.csv
echo ""
date
