#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando KnockMail..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/knockmail.git
cd knockmail
echo "✅ KnockMail instalado correctamente."
