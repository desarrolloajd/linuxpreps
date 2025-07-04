#!/bin/bash
set -e

function instalar_apt() {
  sudo apt-get install -y "$@"
}

echo
echo "========== [Espacio en carpetas] ncdu =========="
instalar_apt ncdu

echo
echo "========== [Información de Software] lshw =========="
instalar_apt lshw

echo
echo "========== [Particiones y Espacio Ocupado] duf =========="
if ! command -v duf > /dev/null; then
  wget https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb -O /tmp/duf.deb
  sudo dpkg -i /tmp/duf.deb
  rm /tmp/duf.deb
else
  echo "duf ya está instalado"
fi

echo
echo "========== [SSH con Roaming] mosh =========="
instalar_apt mosh

echo
echo "========== [Traceroute con Medidores] mtr =========="
instalar_apt mtr

echo
echo "========== [Find con Powerups] fd =========="
if ! command -v fd > /dev/null; then
  instalar_apt fd-find
  if ! command -v fd > /dev/null && command -v fdfind > /dev/null; then
    sudo ln -s $(command -v fdfind) /usr/local/bin/fd
  fi
else
  echo "fd ya está instalado"
fi

echo
echo "========== [Fuzzy Finder buscador en ejecución] fzf =========="
if ! command -v fzf > /dev/null; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
else
  echo "fzf ya está instalado"
fi

echo
echo "========== [Sustituto del ls] exa =========="
if ! command -v exa > /dev/null; then
  EXA_VER="0.10.1"
  wget https://github.com/ogham/exa/releases/download/v${EXA_VER}/exa-linux-x86_64-v${EXA_VER}.zip -O /tmp/exa.zip
  unzip /tmp/exa.zip -d /tmp/exa
  sudo mv /tmp/exa/bin/exa /usr/local/bin/
  sudo chmod +x /usr/local/bin/exa
  rm -r /tmp/exa /tmp/exa.zip
else
  echo "exa ya está instalado"
fi

echo
echo "========== [Visor de Rendimiento] glances =========="
instalar_apt glances

echo
echo "========== [Información completa de un fichero] stat =========="
instalar_apt coreutils  # stat ya viene incluido, pero por si acaso

echo
echo "========== [Monitor de ejecución de comandos en línea temporal] watch =========="
instalar_apt procps  # watch viene aquí

echo
echo "========== [Wireshark en versión consola con UI] termshark =========="
if ! command -v termshark > /dev/null; then
  wget https://github.com/gcla/termshark/releases/download/v2.4.0/termshark_2.4.0_linux_x64.tar.gz -O /tmp/termshark.tar.gz
  tar -xzf /tmp/termshark.tar.gz -C /tmp
  sudo mv /tmp/termshark_2.4.0_linux_x64/termshark /usr/local/bin/
  sudo chmod +x /usr/local/bin/termshark
  rm -r /tmp/termshark_2.4.0_linux_x64 /tmp/termshark.tar.gz
else
  echo "termshark ya está instalado"
fi

echo
echo "========== [Calculadora de subredes rápidas] ipcalc =========="
instalar_apt ipcalc

echo
echo "========== [Pasar ficheros vía p2p] wormhole =========="
if ! command -v wormhole > /dev/null; then
  instalar_apt python3-pip
  pip3 install --user magic-wormhole
  echo "Asegúrate de que ~/.local/bin está en tu PATH para usar wormhole"
else
  echo "wormhole ya está instalado"
fi

echo
echo "========== [Interfaz Interactiva desde consola para docker] lazydocker =========="
if ! command -v lazydocker > /dev/null; then
  wget https://github.com/jesseduffield/lazydocker/releases/download/v0.23.2/lazydocker_0.23.2_Linux_x86_64.tar.gz -O /tmp/lazydocker.tar.gz
  tar -xzf /tmp/lazydocker.tar.gz -C /tmp
  sudo mv /tmp/lazydocker /usr/local/bin/
  sudo chmod +x /usr/local/bin/lazydocker
  rm /tmp/lazydocker.tar.gz
else
  echo "lazydocker ya está instalado"
fi

echo
echo "========== [Información de conexión de red] ifdata =========="
instalar_apt ifdata

echo
echo "========== [Identificador de errores] errno =========="
if ! command -v errno > /dev/null; then
  instalar_apt python3-pip
  pip3 install --user errno
  echo "Asegúrate de que ~/.local/bin está en tu PATH para usar errno"
else
  echo "errno ya está instalado"
fi

echo
echo "========== [Herramienta de descompresión automática] unp =========="
instalar_apt unp

echo
echo "========== [Gestor de Tareas desde CLI] taskwarrior =========="
instalar_apt taskwarrior

echo
echo "========== [CLI conectada con IA] fabric =========="
if ! command -v fab > /dev/null; then
  instalar_apt python3-pip
  pip3 install --user fabric
  echo "Asegúrate de que ~/.local/bin está en tu PATH para usar fabric"
else
  echo "fabric ya está instalado"
fi

echo "========== Instalación finalizada =========="