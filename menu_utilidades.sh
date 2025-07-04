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
  echo -e "${CYAN}8) exa${RESET}          - Sustituto de ls"
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
    1) ncdu ;;
    2) lshw ;;
    3) duf ;;
    4) echo -e "Ejecuta mosh desde cliente SSH. Ejemplo: mosh usuario@host" ;;
    5) mtr ;;
    6) fd . ;;
    7) fzf ;;
    8) exa ;;
    9) glances ;;
    10) read -p "Introduce la ruta del fichero: " archivo; stat "$archivo" ;;
    11) read -p "Comando a monitorizar: " cmd; watch "$cmd" ;;
    12) termshark ;;
    13) read -p "Introduce una IP o red: " datos; ipcalc $datos ;;
    14) wormhole send ;;
    15) lazydocker ;;
    16) ifdata -pa eth0 ;;
    17) read -p "Introduce el código de error: " cod; errno $cod ;;
    18) read -p "Archivo a descomprimir: " fichero; unp "$fichero" ;;
    19) task ;;
    20) fab ;;
    0) echo "¡Hasta luego!"; break ;;
    *) echo "Opción no válida." ;;
  esac
  echo -e "\nPulsa Enter para volver al menú..."
  read
  clear
done