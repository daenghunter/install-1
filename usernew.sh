#!/bin/bash

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`curl icanhazip.com`
echo Script Auto Create SSH & OpenVPN
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Terimakasih telah berlangganan di Daeng SSH Server"
echo -e "Berikut detail account yang telah kami buat"
echo -e "•••••••••••••••••••••••••••••"
echo -e "Host		: $IP" 
echo -e "OpenSSH	: 22,"
echo -e "Dropbear	: 109, 110, 143, 456"
echo -e "SSL/TLS	: 222, 443, 777, 990"
echo -e "Port Squid	: 80, 3128, 8080 (limit to IP SSH)" 
echo -e "OpenVPN 	: TCP 1194 (client config : http://$IP:81/client-tcp-1194.ovpn)"
echo -e "OpenVPN  	: UDP 2200 (client config : http://$IP:81/client-udp-2200.ovpn)"
echo -e "badvpn		: 7200/7300"
echo -e "Username	: $Login "
echo -e "Password	: $Pass"
echo -e "•••••••••••••••••••••••••••••"
echo -e "Aktif Sampai	: $exp"
echo -e "•••••••••••••••••••••••••••••"
echo -e "© Daeng Hunter Groups"