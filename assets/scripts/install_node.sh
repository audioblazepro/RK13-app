#!/data/data/com.termux/files/usr/bin/bash

LOGFILE="/sdcard/Download/logs.txt"

echo "🧰 Iniciando instalación de NodeJS..." >> $LOGFILE
pkg update -y >> $LOGFILE 2>&1
pkg upgrade -y >> $LOGFILE 2>&1

echo "📦 Instalando NodeJS y npm..." >> $LOGFILE
pkg install nodejs -y >> $LOGFILE 2>&1

echo "📁 Verificando versión de node..." >> $LOGFILE
node -v >> $LOGFILE 2>&1

echo "✅ NodeJS instalado correctamente." >> $LOGFILE
