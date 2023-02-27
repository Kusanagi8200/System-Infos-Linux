
#!/bin/bash

echo # 
echo -e "\033[43;30m---> SCRIPT BOOT SEQUENCE SYSTEME LINUX / Copyright (C) Elijah Kaminski/2023 \033[0m"

if [ `whoami` != "root" ]
then
        echo -e "\033[5;41;30m---> ATTENTION. VOUS DEVEZ AVOIR LES DROITS SUDO POUR LANCER CE SCRIPT \033[0m"
        exit 1
fi

echo #
echo # 
echo -e "\033[43;30m---> INFORMATIONS SYSTEME \033[0m"
cat /proc/version
echo #

cat /etc/os-release
echo #

echo #
echo -e "\033[43;30m---> TEMPS DE DÉMARRAGE SYSTEME \033[0m"
systemd-analyze time
echo # 

echo #
echo -e "\033[43;30m---> TEMPS DE DÉMARRAGE PAR UNITÉS \033[0m"
systemd-analyze critical-chain
echo # 

echo #
echo -e "\033[43;30m---> UNITÉS NON DÉMARRÉES \033[0m"
systemctl --failed 
echo #

echo #
echo -e "\033[43;30m---> LISTE DES SERVICES DÉMARRÉS \033[0m"
service --status-all |grep -Ev "-"
echo #

echo #
echo -e "\033[43;30m---> LISTE DES SERVICES ETEINS \033[0m"
service --status-all |grep -E " - "
echo #

echo #
echo -e "\033[43;30m---> TEST CONNEXION RÉSEAU \033[0m"
ping -v -c 4 1.1.1.1
echo #

echo #
echo -e "\033[43;30m ---> FIN DU SCRIPT <--- \033[0m"
echo #
