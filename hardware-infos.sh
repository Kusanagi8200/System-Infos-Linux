#!/bin/bash

# This program is free software : you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.


echo # 
echo -e "\033[43;30mSCRIPT CHECK HARDWARE - SYSTEME LINUX / Copyright (C) Elijah Kaminski/2023 \033[0m"

if [ `whoami` != "root" ]
then
        echo -e "\033[5;41;30mATTENTION. VOUS DEVEZ AVOIR LES DROITS SUDO POUR LANCER CE SCRIPT \033[0m"
        exit 1
fi
echo #

echo #
echo -e "\033[43;30m ---> MACHINE <--- \033[0m"
echo #
inxi -M
echo #

echo #
echo -e "\033[43;30m ---> MEMOIRE <--- \033[0m"
echo #
inxi -m
echo #

echo #
echo -e "\033[43;30m ---> CPU <--- \033[0m"
echo #
inxi -C
echo #

echo #
echo -e "\033[43;30m ---> GRAPHICS <--- \033[0m"
echo #
inxi -G
echo #

echo #
echo -e "\033[43;30m ---> NETWORK <--- \033[0m"
echo #
inxi -n
echo #

echo #
echo -e "\033[43;30m ---> DRIVES <--- \033[0m"
echo #
inxi -D
echo #

echo #
echo -e "\033[43;30m ---> PARTITIONS <--- \033[0m"
echo #
inxi -p
echo #

echo #
echo -e "\033[43;30m ---> FSTAB <--- \033[0m"
cat /etc/fstab
echo # 

echo #
echo -e "\033[43;30m ---> FIN DU SCRIPT <--- \033[0m"
echo #