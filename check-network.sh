#!/bin/bash

# This program is free software : you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.


echo # 
echo -e "\033[43;30mSCRIPT CHECK NETWORK - SYSTEME LINUX / Copyright (C) Elijah Kaminski/2023\033[0m"

if [ `whoami` != "root" ]
then
        echo -e "\033[5;41;30mATTENTION. VOUS DEVEZ AVOIR LES DROITS SUDO POUR LANCER CE SCRIPT \033[0m"
        exit 1
fi
echo #

# LISTER LES INTERFACES RESEAUX
echo -e "\033[43;30m ---> INTERFACES RESEAUX <--- \033[0m"
lshw -class network |grep -Ev "(capabilities|configuration|resources|capacity|version|vendor|width|clock|bus info)"
echo #
echo #

# LISTER CONFIG INTERFACES RESEAUX
echo -e "\033[43;30m ---> CONFIG INTERFACES RESEAUX <--- \033[0m"
ifconfig |grep -E "(*: |inet |ether|loop)"
echo #
echo #

# DETERMINER GATEWAY
echo -e "\033[43;30m ---> GATEWAY <--- \033[0m"
ip route | grep default | cut -d" " -f3
echo #
echo #

# DETERMINER SERVEUR DNS
echo -e "\033[43;30m ---> SERVEUR DNS <--- \033[0m"
grep "nameserver" /etc/resolv.conf |
echo #
echo #

# PING DNS 
echo -e "\033[43;30m ---> PING <--- \033[0m"
ping 1.1.1.1 -c 5
echo #
echo #

# ADRESSE IP PUBLIC
echo -e "\033[43;30m ---> IP PUBLIC <--- \033[0m"
dig +short myip.opendns.com @resolver1.opendns.com
echo #
echo #

# INFOS SUR LE ROUTAGE
echo -e "\033[43;30m --->  ROUTAGE <--- \033[0m"
netstat -grep
echo #
echo #

# INFOS SUR LE ROUTAGE2
echo -e "\033[43;30m --->  ACTIVES CONNECTIONS<--- \033[0m"
netstat -alpnet
echo #
echo #

# TRACEROUTE CHECK
echo -e "\033[43;30m --->  TRACEROUTE CHECK <--- \033[0m"
traceroute 1.1.1.1 --resolve-hostnames
echo #
echo #

# TEST DEBIT CONNEXION
echo -e "\033[43;30m --->  TEST DEBIT CONNEXION <--- \033[0m"
curl --max-time 3 -4 -o /dev/null http://bouygues.testdebit.info/10G.iso
echo #

echo #
echo -e "\033[43;30m ---> FIN DU SCRIPT <--- \033[0m"
echo # 
