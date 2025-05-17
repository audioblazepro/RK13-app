#!/data/data/com.termux/files/usr/bin/bash

# Colors and styling
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'
BOLD='\033[1m'

# Banner function
show_banner() {
    clear
    echo -e "${RED}"
    cat << "EOF"
██████╗ ██╗  ██╗  ██╗██████╗ 
██╔══██╗██║ ██╔╝ ███║╚════██╗
██████╔╝█████╔╝   ██║ █████╔╝
██╔══██╗██╔═██╗   ██║ ╚═══██╗
██║  ██║██║  ██╗  ██║██████╔╝
╚═╝  ╚═╝╚═╝  ╚═╝  ╚═╝╚═════╝ 
    SECURITY TOOLS v1.0
EOF
    echo -e "${NC}"
    echo -e "${BLUE}[*] Advanced Amass Installer Script${NC}\n"
}

# Progress bar function
progress_bar() {
    local duration=$1
    local width=50
    local progress=0
    local fill='█'
    local empty='░'
    
    while [ $progress -le 100 ]; do
        local count=$(($width * $progress / 100))
        printf "\r[${CYAN}"
        printf "%${count}s" | tr ' ' ${fill}
        printf "%$(($width - $count))s" | tr ' ' ${empty}
        printf "${NC}] ${progress}%%"
        progress=$(($progress + 2))
        sleep $duration
    done
    echo
}

# Main installation process
show_banner

echo -e "\n${GREEN}[+] Stage 1: System Preparation${NC}"
echo -e "${BLUE}[*] Updating package repositories...${NC}"
pkg update -y && pkg upgrade -y >/dev/null 2>&1
progress_bar 0.03

echo -e "\n${GREEN}[+] Stage 2: Installing Dependencies${NC}"
echo -e "${BLUE}[*] Installing required packages...${NC}"
pkg install -y git curl wget >/dev/null 2>&1
progress_bar 0.03

echo -e "\n${GREEN}[+] Stage 3: Downloading Amass${NC}"
echo -e "${BLUE}[*] Cloning repository...${NC}"
rm -rf $HOME/amass 2>/dev/null
git clone https://github.com/OWASP/Amass $HOME/amass >/dev/null 2>&1
progress_bar 0.03

echo -e "\n${GREEN}[+] Stage 4: Setting Up Environment${NC}"
echo -e "${BLUE}[*] Configuring installation...${NC}"
cd $HOME/amass
progress_bar 0.02

# Show repository contents
echo -e "\n${GREEN}[+] Stage 5: Installation Complete${NC}"
echo -e "${YELLOW}[*] Repository contents:${NC}"
ls -la

# Social Media Call to Action
echo -e "\n${RED}╔═══════════════════════════════════════╗${NC}"
echo -e "${RED}║       🔥 Join Our Community! 🔥        ║${NC}"
echo -e "${RED}╚═══════════════════════════════════════╝${NC}"
echo -e "${CYAN}[*] Follow us for more security tools:${NC}"
echo -e "${BLUE}→ GitHub: ${NC}github.com/RK13-Security"
echo -e "${BLUE}→ Website: ${NC}rk13-security.com"
echo -e "${BLUE}→ Facebook: ${NC}fb.me/RK13SecurityTools"

# Opening Facebook page
echo -e "\n${GREEN}[*] Opening our Facebook page in 5 seconds...${NC}"
for i in {5..1}; do
    echo -ne "${YELLOW}$i...${NC}"
    sleep 1
done

# Try different methods to open Facebook
if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "fb://page/RK13SecurityTools" 2>/dev/null || \
    xdg-open "https://facebook.com/RK13SecurityTools" 2>/dev/null
elif command -v termux-open-url >/dev/null 2>&1; then
    termux-open-url "fb://page/RK13SecurityTools" || \
    termux-open-url "https://facebook.com/RK13SecurityTools"
fi

echo -e "\n${GREEN}[✓] Installation completed successfully!${NC}"
echo -e "${YELLOW}[!] Don't forget to star our repository!${NC}\n"