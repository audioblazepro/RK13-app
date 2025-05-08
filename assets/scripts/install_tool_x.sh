#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando Tool-X..."
pkg update -y && pkg upgrade -y
pkg install git -y
git clone https://github.com/example/tool_x.git
cd tool_x
echo "✅ Tool-X instalado correctamente."
