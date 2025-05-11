#!/usr/bin/env bash
#
# Instalador Profesional — Hack-Tools (versión dinámica)
# Autor: Equipo de Pentesting Ético
# Fecha: $(date +"%Y-%m-%d")
#

### COLORES Y ESTILO ###
RESET="\e[0m"
BOLD="\e[1m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
WHITE="\e[97m"

### VALORES POR DEFECTO ###
DEFAULT_REPO_URL="https://github.com/hacktoolspack/hack-tools.git"
DEFAULT_TARGET_DIR="$HOME/storage/shared/HackToolsTC"
DRY_RUN=false
LOGFILE="install.log"

### MUESTRA AYUDA ###
print_help() {
  echo
  cat <<EOF
${BOLD}USO:${RESET} $(basename "$0") [OPCIONES]

OPCIONES:
  -r REPO_URL    URL del repositorio (por defecto: $DEFAULT_REPO_URL)
  -d TARGET_DIR  Directorio destino (por defecto: $DEFAULT_TARGET_DIR)
  -n             Modo dry-run (simula sin ejecutar cambios)
  -h             Muestra esta ayuda
EOF
  echo
  exit 0
}

### LOG SIMPLE ###
log() {
  echo
  # Fecha en tiempo real, negrita
  echo -e "[${BOLD}$(date +"%H:%M:%S")${RESET}] ${BOLD}$*${RESET}" | tee -a "$LOGFILE"
  echo
}

### CAPTURA SEÑALES ###
# Función para manejar interrupciones (CTRL+C)
on_interrupt() {
  tput cnorm  # muestra cursor
  echo
  echo -e "${RED}${BOLD}INTERRUPCIÓN DETECTADA. SALIENDO...${RESET}"
  exit 1
}
# Captura solo SIGINT y SIGTERM (no EXIT)
trap on_interrupt SIGINT SIGTERM

### BANNER PERSONALIZADO ###
print_banner() {
  clear
  echo
  echo -e "${RED}${BOLD}############################################${RESET}"
  echo -e "${RED}${BOLD}#${RESET}  ${WHITE}${BOLD}INSTALADOR PROFESIONAL: ${CYAN}${REPO_NAME^^}${RESET}  ${RED}${BOLD}#${RESET}"
  echo -e "${RED}${BOLD}############################################${RESET}"
  echo
}

### SPINNER PARA FEEDBACK ###
spinner_start() {
  local msg="$1"
  echo
  echo -e -n "$msg"
  tput civis
  (
    while :; do for c in '/-\\|'; do printf "\b$c"; sleep 0.1; done; done
  ) &
  SPINNER_PID=$!
}
spinner_stop() {
  kill "$SPINNER_PID" &>/dev/null
  wait "$SPINNER_PID" 2>/dev/null
  printf "\b"
  tput cnorm
  echo -e " ${GREEN}${BOLD}✔${RESET}"
  echo
}

### LEE ARGUMENTOS ###
parse_args() {
  while getopts "r:d:nh" opt; do
    case $opt in
      r) REPO_URL=$OPTARG ;;
      d) TARGET_DIR=$OPTARG ;;
      n) DRY_RUN=true ;;
      h) print_help ;;
      *) print_help ;;
    esac
  done
  REPO_URL=${REPO_URL:-$DEFAULT_REPO_URL}
  TARGET_DIR=${TARGET_DIR:-$DEFAULT_TARGET_DIR}
  REPO_NAME="$(basename "${REPO_URL}" .git)"
}

### VERIFICA TERMUX ###
check_termux() {
  echo
  if ! command -v pkg &>/dev/null; then
    echo -e "${RED}${BOLD}ERROR:${RESET} Este instalador es exclusivo para Termux."
    echo
    exit 1
  fi
  echo
}

### DEPENDENCIAS ###
check_dependencies() {
  log "${CYAN}${BOLD}INSTALANDO DEPENDENCIAS:${RESET} git, clang, make, autoconf, automake, libtool, pkg-config, openssl"
  if $DRY_RUN; then
    log "[DRY-RUN] pkg update && pkg install git clang make autoconf automake libtool pkg-config openssl"
  else
    pkg update -y && pkg upgrade -y
    pkg install -y git clang make autoconf automake libtool pkg-config openssl
  fi
}

### CONFIRMA SOBREESCRITURA ###
confirm_override() {
  echo
  if [ -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}${BOLD}EL DIRECTORIO $TARGET_DIR EXISTE. ¿SOBRESCRIBIR? (S/N):${RESET}"
    read -r yn
    case $yn in
      [Ss]*) rm -rf "$TARGET_DIR" ;;
      *) echo; exit 1 ;;
    esac
  fi
  echo
}

### DESCRIPCIÓN EN ESPAÑOL ###
describe_repository() {
  echo
  echo -e "${WHITE}${BOLD}BIENVENIDO AL REPOSITORIO \"HACK-TOOLS\". ESTA COLECCIÓN CONTIENE UNA DIVERSA VARIEDAD DE HERRAMIENTAS DE CIBERSEGURIDAD, INCLUYENDO:${RESET}"
  echo
  echo -e "${WHITE}  • HERRAMIENTAS DOS (DENIAL OF SERVICE)"
  echo -e "${WHITE}  • UTILIDADES DE RECOLECCIÓN DE INFORMACIÓN"
  echo -e "${WHITE}  • CREACIÓN DE MALWARE Y GENERADORES DE VIRUS"
  echo -e "${WHITE}  • KITS DE DESARROLLO DE RANSOMWARE"
  echo -e "${WHITE}  • HERRAMIENTAS RATs (REMOTE ADMINISTRATION TOOLS)"
  echo
  echo -e "${WHITE}DIRIGIDO DESDE SCRIPT KIDDIES HASTA PROFESIONALES Y EMPRESAS. TODO EL SOFTWARE ES GRATUITO."
  echo
  echo -e "${WHITE}${BOLD}IMPORTANTE:${RESET}${WHITE} EL AUTOR NO SE RESPONSABILIZA POR DAÑOS DERIVADOS DE SU USO O MAL USO. CUMPLE CON TODAS LAS LEYES Y REGULACIONES APLICABLES."
  echo
  echo -e "${WHITE}${BOLD}REQUISITOS:${RESET}"
  echo -e "${WHITE}  • WINDOWS, LINUX"
  echo -e "${WHITE}  • ${YELLOW}${BOLD}PYTHON${RESET}${WHITE}, RUBY, JAVA Y MÁS"
  echo
  echo -e "${WHITE}${BOLD}NOTAS:${RESET}"
  echo -e "${WHITE}  • FASE ALFA/BETA; POSIBLES BUGS."
  echo -e "${WHITE}  • PROYECTOS DE TERCEROS: VERSIONES PUEDEN ESTAR DESACTUALIZADAS."
  echo -e "${WHITE}  • ACTUALIZACIONES IRREGULARES."
  echo -e "${WHITE}  • CONTRASEÑA PARA .EXE/.7Z/.ZIP: a"
  echo
}

### CLONAR REPOSITORIO ###
clone_repository() {
  log "${CYAN}${BOLD}CLONANDO:${RESET} ${REPO_URL} ${CYAN}EN${RESET} ${BOLD}${TARGET_DIR}${RESET}"
  echo

  # Barra de progreso estilo Node.js
  echo -e -n "${YELLOW}${BOLD}DESCARGANDO PAQUETES ILEGALES...${RESET} ["
  git clone --depth=1 "${REPO_URL}" "${TARGET_DIR}" &>/dev/null &
  CLONE_PID=$!

  while kill -0 "$CLONE_PID" 2>/dev/null; do
    echo -n "#"
    sleep 0.1
  done
  echo "]"
  wait "$CLONE_PID"

  if [ -d "$TARGET_DIR" ] && ! $DRY_RUN; then
    log "${GREEN}${BOLD}CLONACIÓN EXITOSA.${RESET}"
  else
    log "${RED}${BOLD}ERROR:${RESET} CLONACIÓN FALLIDA."
    exit 1
  fi
}

### VERIFICACIÓN POST-INSTALACIÓN ###
post_install_verification() {
  log "${WHITE}${BOLD}VERIFICANDO CONTENIDO...${RESET}"
  if $DRY_RUN; then
    log "[DRY-RUN] ls \"${TARGET_DIR}\" | head -n 5"
  else
    ls "${TARGET_DIR}" | head -n 5
  fi
  echo
}

### MUESTRA UBICACIÓN Y CD FINAL ###
show_location() {
  echo
  echo -e "${WHITE}ARCHIVOS EN:${RESET} ${BOLD}${TARGET_DIR}${RESET}"
  echo
  cd "${TARGET_DIR}" || exit
  echo -e "${WHITE}${BOLD}CAMBIADO A DIRECTORIO:${RESET} ${TARGET_DIR}"
  echo
}

### ALERTA Y COPY AIDA ###
show_alert() {
  echo
  echo -e "${RED}${BOLD}⚠️ ALERTA FINAL ⚠️${RESET}"
  echo
  echo -e "${BOLD}${WHITE}ESTÁS A PUNTO DE DOMINAR LO PROHIBIDO. IMAGINA SER ARQUITECTO DE EXPLOITS, ESCRIBIENDO TUS PROPIOS SCRIPTS Y AUTOMATIZANDO CADA PASO. DOMINA ${YELLOW}${BOLD}PYTHON${RESET}${BOLD}${WHITE} PARA ENTENDER CADA LÍNEA DE CÓDIGO Y CREAR PROGRAMAS ÚNICOS QUE ELEVEN TU NIVEL. USO ÉTICO Y EDUCATIVO. ¡NO LO DESPERDICIES!${RESET}"
  echo
}

### CUENTA REGRESIVA Y REDIRECCIÓN ###
countdown_redirect() {
  echo
  echo -e "${CYAN}${BOLD}REDIRECCIONANDO EN 5 SEGUNDOS...${RESET}"
  for i in {5..1}; do echo -ne "\r ${BOLD}$i${RESET}... "; sleep 1; done
  echo -e "\n"
  am start -a android.intent.action.VIEW -d "https://go.hotmart.com/S99672631V?ap=7ba0" &>/dev/null
  echo -e "${GREEN}${BOLD}✔ DISFRUTA DE TUS NUEVOS PROGRAMAS DE HACKING${RESET}"
  echo
}

### LISTA CONTENIDO FINAL ###
list_contents() {
  echo
  echo -e "${WHITE}${BOLD}CONTENIDO DE $(pwd):${RESET}"
  ls -lah
}

### RESUMEN FINAL ###
final_summary() {
  echo
  echo -e "${GREEN}${BOLD}INSTALACIÓN COMPLETADA EXITOSAMENTE!${RESET}"
  echo -e "${CYAN}¡EXPLORA LAS HERRAMIENTAS DESCARGADAS Y EMPIEZA A HACKEAR COMO PROFESIONAL!${RESET}"
  echo
}
${BOLD}CONTENIDO DE $(pwd):${RESET}"
  ls -lah
}

### FLUJO PRINCIPAL ###
main() {
  parse_args "$@"
  >"$LOGFILE"
  print_banner
  check_termux
  describe_repository
  echo -e "${YELLOW}${BOLD}PRECIONA ENTER PARA CONTINUAR...${RESET}"
  read -r
  check_dependencies
  confirm_override
  clone_repository
  post_install_verification
  show_location
  show_alert
  countdown_redirect
  list_contents
}

main "$@"
