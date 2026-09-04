#!/bin/bash

# Colores para el menú
GREEN="\e[32m"
CYAN="\e[36m"
RESET="\e[0m"

show_menu() {
  echo -e "${GREEN}========== Menú de Utilidades ==========${RESET}"
  echo -e "${CYAN}1) ncdu${RESET}         - Espacio en carpetas"
  echo -e "${CYAN}2) lshw${RESET}         - Información de hardware"
  echo -e "${CYAN}3) duf${RESET}          - Particiones y espacio ocupado"
  echo -e "${CYAN}4) mosh${RESET}         - SSH con roaming"
  echo -e "${CYAN}5) mtr${RESET}          - Traceroute con medidores"
  echo -e "${CYAN}6) fd${RESET}           - Find con powerups"
  echo -e "${CYAN}7) fzf${RESET}          - Fuzzy finder"
  echo -e "${CYAN}8) eza${RESET}          - Sustituto de ls"
  echo -e "${CYAN}9) glances${RESET}      - Visor de rendimiento"
  echo -e "${CYAN}10) stat${RESET}        - Información de un fichero"
  echo -e "${CYAN}11) watch${RESET}       - Monitor de comandos"
  echo -e "${CYAN}12) termshark${RESET}   - Wireshark en consola (UI)"
  echo -e "${CYAN}13) ipcalc${RESET}      - Calculadora de subredes"
  echo -e "${CYAN}14) wormhole${RESET}    - Pasar ficheros p2p"
  echo -e "${CYAN}15) lazydocker${RESET}  - Interfaz interactiva para Docker"
  echo -e "${CYAN}16) ifdata${RESET}      - Información de conexión de red"
  echo -e "${CYAN}17) errno${RESET}       - Identificador de errores"
  echo -e "${CYAN}18) unp${RESET}         - Descompresión automática"
  echo -e "${CYAN}19) taskwarrior${RESET} - Gestor de tareas CLI"
  echo -e "${CYAN}20) fabric${RESET}      - CLI conectada con IA"
  echo -e "${CYAN}0) Salir${RESET}"
}

while true; do
  show_menu
  read -p "Selecciona una opción: " opcion
  case $opcion in
    1) command -v ncdu >/dev/null 2>&1 && ncdu || echo "ncdu no instalado."; ;;
    2) command -v lshw >/dev/null 2>&1 && lshw || echo "lshw no instalado."; ;;
    3) command -v duf >/dev/null 2>&1 && duf || echo "duf no instalado."; ;;
    4) echo -e "Ejecuta mosh desde cliente SSH. Ejemplo: mosh usuario@host" ;;
    5) command -v mtr >/dev/null 2>&1 && mtr || echo "mtr no instalado."; ;;
    6) command -v fd >/dev/null 2>&1 && fd . || echo "fd no instalado."; ;;
    7) command -v fzf >/dev/null 2>&1 && fzf || echo "fzf no instalado."; ;;
    8) command -v eza >/dev/null 2>&1 && eza || echo "eza no instalado."; ;;
    9) command -v glances >/dev/null 2>&1 && glances || echo "glances no instalado."; ;;
    10) read -p "Introduce la ruta del fichero: " archivo; command -v stat >/dev/null 2>&1 && stat "$archivo" || echo "stat no instalado."; ;;
    11) read -p "Comando a monitorizar: " cmd; command -v watch >/dev/null 2>&1 && watch "$cmd" || echo "watch no instalado."; ;;
    12) command -v termshark >/dev/null 2>&1 && termshark || echo "termshark no instalado."; ;;
    13) read -p "Introduce una IP o red: " datos; command -v ipcalc >/dev/null 2>&1 && ipcalc $datos || echo "ipcalc no instalado."; ;;
    14) command -v wormhole >/dev/null 2>&1 && wormhole send || echo "wormhole no instalado."; ;;
    15) command -v lazydocker >/dev/null 2>&1 && lazydocker || echo "lazydocker no instalado."; ;;
    16) command -v ifdata >/dev/null 2>&1 && ifdata -pa eth0 || echo "ifdata no instalado."; ;;
    17) read -p "Introduce el código de error: " cod; command -v errno >/dev/null 2>&1 && errno $cod || echo "errno no instalado."; ;;
    18) read -p "Archivo a descomprimir: " fichero; command -v unp >/dev/null 2>&1 && unp "$fichero" || echo "unp no instalado."; ;;
    19) command -v task >/dev/null 2>&1 && task || echo "taskwarrior no instalado."; ;;
    20) command -v fab >/dev/null 2>&1 && fab || echo "fabric no instalado."; ;;
    0) echo "¡Hasta luego!"; break ;;
    *) echo "Opción no válida."; ;;
  esac
  echo -e "\nPulsa Enter para volver al menú..."
  read
  clear
done