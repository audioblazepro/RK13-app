#!/data/data/com.termux/files/usr/bin/bash
echo "📦 Instalando Python Environment..."
pkg update -y
pkg install python -y
python --version
