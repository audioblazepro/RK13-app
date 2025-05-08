#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Metasploit..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/metasploit.git
cd metasploit
echo "✅ Metasploit instalado correctamente."
