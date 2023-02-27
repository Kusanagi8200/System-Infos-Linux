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
echo -e "\033[43;30m ---> INFOS SYSTEME <--- \033[0m"
echo #
inxi -S
echo #

echo #
echo -e "\033[43;30m---> INFOS DISTRIBUTION \033[0m"
echo #
cat /etc/os-release
echo #

echo #
echo -e "\033[43;30m ---> REPOS <--- \033[0m"
echo #
inxi -r
echo #

echo #
echo -e "\033[43;30m ---> FIN DU SCRIPT <--- \033[0m"
echo #
