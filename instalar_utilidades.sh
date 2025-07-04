#!/bin/bash
set -e

print_green() { echo -e "\e[32m$1\e[0m"; }
print_yellow() { echo -e "\e[33m$1\e[0m"; }
print_blue() { echo -e "\e[34m$1\e[0m"; }
print_magenta() { echo -e "\e[35m$1\e[0m"; }

instalar_apt() {
  sudo apt-get install -y "$@" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    print_blue "$* instalado correctamente."
  else
    print_yellow "Hubo un problema instalando $*."
  fi
}

print_magenta "------------------------------------------"
print_green "========== [Espacio en carpetas] ncdu =========="
print_magenta "------------------------------------------"
instalar_apt ncdu

print_magenta "------------------------------------------"
print_green "========== [Información de Software] lshw =========="
print_magenta "------------------------------------------"
instalar_apt lshw

print_magenta "------------------------------------------"
print_green "========== [Particiones y Espacio Ocupado] duf =========="
print_magenta "------------------------------------------"
if ! command -v duf > /dev/null; then
  wget -q https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb -O /tmp/duf.deb
  sudo dpkg -i /tmp/duf.deb > /dev/null 2>&1
  rm /tmp/duf.deb
  print_blue "duf instalado correctamente."
else
  print_yellow "duf ya está instalado."
fi

print_magenta "------------------------------------------"
print_green "========== [SSH con Roaming] mosh =========="
print_magenta "------------------------------------------"
instalar_apt mosh

print_magenta "------------------------------------------"
print_green "========== [Traceroute con Medidores] mtr =========="
print_magenta "------------------------------------------"
instalar_apt mtr

print_magenta "------------------------------------------"
print_green "========== [Find con Powerups] fd =========="
print_magenta "------------------------------------------"
if ! command -v fd > /dev/null; then
  instalar_apt fd-find
  if ! command -v fd > /dev/null && command -v fdfind > /dev/null; then
    sudo ln -s $(command -v fdfind) /usr/local/bin/fd
  fi
  print_blue "fd instalado correctamente."
else
  print_yellow "fd ya está instalado."
fi

print_magenta "------------------------------------------"
print_green "========== [Fuzzy Finder buscador en ejecución] fzf =========="
print_magenta "------------------------------------------"
if ! command -v fzf > /dev/null; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf > /dev/null 2>&1
  ~/.fzf/install --all > /dev/null 2>&1
  print_blue "fzf instalado correctamente."
else
  print_yellow "fzf ya está instalado."
fi

print_magenta "------------------------------------------"
print_green "========== [Sustituto del ls] exa =========="
print_magenta "------------------------------------------"
if ! command -v exa > /dev/null; then
  EXA_VER="0.10.1"
  wget -q https://github.com/ogham/exa/releases/download/v${EXA_VER}/exa-linux-x86_64-v${EXA_VER}.zip -O /tmp/exa.zip
  unzip -q /tmp/exa.zip -d /tmp/exa
  sudo mv /tmp/exa/bin/exa /usr/local/bin/
  sudo chmod +x /usr/local/bin/exa
  rm -r /tmp/exa /tmp/exa.zip
  print_blue "exa instalado correctamente."
else
  print_yellow "exa ya está instalado."
fi

print_magenta "------------------------------------------"
print_green "========== [Visor de Rendimiento] glances =========="
print_magenta "------------------------------------------"
instalar_apt glances

print_magenta "------------------------------------------"
print_green "========== [Información completa de un fichero] stat =========="
print_magenta "------------------------------------------"
instalar_apt coreutils

print_magenta "------------------------------------------"
print_green "========== [Monitor de ejecución de comandos en línea temporal] watch =========="
print_magenta "------------------------------------------"
instalar_apt procps

print_magenta "------------------------------------------"
print_green "========== [Wireshark en versión consola con UI] termshark =========="
print_magenta "------------------------------------------"
if ! command -v termshark > /dev/null; then
  wget -q https://github.com/gcla/termshark/releases/download/v2.4.0/termshark_2.4.0_linux_x64.tar.gz -O /tmp/termshark.tar.gz
  tar -xzf /tmp/termshark.tar.gz -C /tmp
  sudo mv /tmp/termshark_2.4.0_linux_x64/termshark /usr/local/bin/
  sudo chmod +x /usr/local/bin/termshark
  rm -r /tmp/termshark_2.4.0_linux_x64 /tmp/termshark.tar.gz
  print_blue "termshark instalado correctamente."
else
  print_yellow "termshark ya está instalado."
fi

print_magenta "------------------------------------------"
print_green "========== [Calculadora de subredes rápidas] ipcalc =========="
print_magenta "------------------------------------------"
instalar_apt ipcalc

print_magenta "------------------------------------------"
print_green "========== [Pasar ficheros vía p2p] wormhole =========="
print_magenta "------------------------------------------"
if ! command -v wormhole > /dev/null; then
  instalar_apt python3-pip
  pip3 install --user magic-wormhole > /dev/null 2>&1
  print_blue "wormhole instalado correctamente. Añade ~/.local/bin a tu PATH si no lo está."
else
  print_yellow "wormhole ya está instalado."
fi

print_magenta "------------------------------------------"
print_green "========== [Interfaz Interactiva desde consola para docker] lazydocker =========="
print_magenta "------------------------------------------"
if ! command -v lazydocker > /dev/null; then
  wget -q https://github.com/jesseduffield/lazydocker/releases/download/v0.23.2/lazydocker_0.23.2_Linux_x86_64.tar.gz -O /tmp/lazydocker.tar.gz
  tar -xzf /tmp/lazydocker.tar.gz -C /tmp
  sudo mv /tmp/lazydocker /usr/local/bin/
  sudo chmod +x /usr/local/bin/lazydocker
  rm /tmp/lazydocker.tar.gz
  print_blue "lazydocker instalado correctamente."
else
  print_yellow "lazydocker ya está instalado."
fi

print_magenta "------------------------------------------"
print_green "========== [Información de conexión de red] ifdata =========="
print_magenta "------------------------------------------"
instalar_apt ifdata

print_magenta "------------------------------------------"
print_green "========== [Identificador de errores] errno =========="
print_magenta "------------------------------------------"
if ! command -v errno > /dev/null; then
  instalar_apt python3-pip
  pip3 install --user errno > /dev/null 2>&1
  print_blue "errno instalado correctamente. Añade ~/.local/bin a tu PATH si no lo está."
else
  print_yellow "errno ya está instalado."
fi

print_magenta "------------------------------------------"
print_green "========== [Herramienta de descompresión automática] unp =========="
print_magenta "------------------------------------------"
instalar_apt unzip
instalar_apt unp

print_magenta "------------------------------------------"
print_green "========== [Gestor de Tareas desde CLI] taskwarrior =========="
print_magenta "------------------------------------------"
instalar_apt taskwarrior

print_magenta "------------------------------------------"
print_green "========== [CLI conectada con IA] fabric =========="
print_magenta "------------------------------------------"
if ! command -v fab > /dev/null; then
  instalar_apt python3-pip
  pip3 install --user fabric > /dev/null 2>&1
  print_blue "fabric instalado correctamente. Añade ~/.local/bin a tu PATH si no lo está."
else
  print_yellow "fabric ya está instalado."
fi

print_green "========== Instalación finalizada =========="
