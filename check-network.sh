#!/bin/bash

# LISTER LES INTERFACES RESEAUX
lshw -class network

# LISTER CONFIG INTERFACES RESEAUX
ifconfig -a

# DETERMINER GATEWAY 
ip route | grep default | cut -d" " -f3

# DETERMINER SERVEUR DNS
grep "nameserver" /etc/resolv.conf | tail -1 | cut -d" " -f2

# PING DNS 
ping 1.1.1.1 -c 5

# ADRESSE IP PUBLIC
dig +short myip.opendns.com @resolver1.opendns.com

# INFOS SUR LE ROUTAGE
netstat -grep

# INFOS SUR LE ROUTAGE2
netstat -alpnet

# SERVEUR EN ECOUTE
netstat -tlp

# CONNECTIONS ACTIVES
netstat -nulp

# CONNECTIONS TCP-UDP
netstat -atu

# TRACEROUTE CHECK
traceroute 1.1.1.1 --resolve-hostnames



