#!/bin/bash
#Autor: Patrick
#Blog: ----> https://bartoi.blogspot.com.br/ <------


echo "================================================="
echo "          Assistente pós-instalação Debian       "
echo "================================================="
echo
echo "Todos os comandos a seguir serão executados sequencialmente, sem dar a opções ao usuário. Queres continuar? [S/N]"
read op

if [ "$op"="s" ];then
    rm /etc/apt/sources.list
    touch /etc/apt/sources.list
    echo "Adicionando pacotes..."
    #Packages
    cd /etc/apt/
    sh -c "echo deb-src  http://ftp.br.debian.org/debian jessie main contrib non-free" >> /etc/apt/sources.list
    echo "deb http://ftp.br.debian.org/debian jessie main contrib non-free" >> /etc/apt/sources.list
    echo "deb-src http://ftp.br.debian.org/debian jessie main contrib non-free" >> /etc/apt/sources.list
    #Security
    echo  "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
    echo "deb-src http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
    #Updates
    echo "deb http://ftp.br.debian.org/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list
    echo "deb-src http://ftp.br.debian.org/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list
    #Multimedia
    echo "deb http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list
    echo "deb-src http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list
    #Backports
    echo "deb http://ftp.br.debian.org/debian/ jessie-backports main contrib non-free" >> /etc/apt/sources.list
    #deepstream
    echo "deb http://dl.bintray.com/deepstreamio/deb jessie main" >> /etc/apt/sources.list
    #rethinkdb
echo "deb http://download.rethinkdb.com/apt jessie main" >> /etc/apt/sources.list
    # proximo
echo "deb http://download.virtualbox.org/virtualbox/debian jessie contrib" >> /etc/apt/sources.list
    # proximo
echo "" >> /etc/apt/sources.list
    sleep 2
    clear
    echo "Adicionando chaves dos pacotes..."
    wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    sleep 2
    clear
    echo "Atualizando o sistema..."
    sleep 2
    clear
    apt-get update
    apt-get install -y deb-multimedia-keyring
    apt-get update
    apt-get upgrade
    apt-get dist-upgrade
    sleep 2
    clear
    echo "Instalando alternativo ao Flash Plugin, o Lightspark..."
     apt-get install -y lightspark
    sleep 1
    echo "Instalando Java JDK"
    apt-get install -y openjdk-7-jdk openjdk-7-jre icedtea-7-plugin
    sleep 2
    clear
    echo "Instalando gerenciadores de pacotes..."
    echo "Synaptic, gdebi e gksu"
    apt-get install -y synaptic gdebi gksu
    sleep 2
    clear
    echo "Instalando pacotes de programas..."
    echo "File-roller: Gerenciador de arquivos"
    echo "Evince: Leitor de PDF"
    echo "Qalculate: Calculadora"
    echo "Clementine: Audio player"
    echo "Vlc: Video player"
    echo "Bleachbit: Usado para limpar o sistema"
    echo "Gimp: Editor de imagens"
    echo "Gparted: Gerenciador de partições"
    echo "Gnome disk utility: Gerenciador/visualizador de uso de disco"
    sleep 2
    apt-get install -y file-roller evince  qalculate clementine vlc bleachbit gimp gparted gnome-disk-utility
    echo
   clear
   echo "Instalando pacotes essenciais..."
   apt-get install build-essential libssl-dev git curl python-software-properties dkms
   aptitude install libavcodec-extra
    aptitude install gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad gstreamer0.10-fluendo-mp3 gstreamer0.10-pulseaudio
   aptitude install libgstreamer-perl libgstreamer-interfaces-perl
   clear
   echo "Instalando Administradores de pacotes"
   apt-get install synaptic apt-xapian-index gdebi gksu
   clear
   clear
	#AMD CPU e INTEL CPU – CPU Firmware
	#AMD CPU
	# sudo apt-get install amd64-microcode
	#Intel CPU
	# sudo apt-get install intel-microcode
   echo "Instalando Firmware Package "
   apt-get install firmware-linux intel-microcode
   clear
   clear
   echo "Instalando Fontes extras, Flash Plugin, Pepperflash Plugin, Icedtea Plugin "
   apt-get install ttf-freefont ttf-mscorefonts-installer ttf-bitstream-vera ttf-dejavu ttf-liberation flashplugin-nonfree pepperflashplugin-nonfree icedtea-plugin
   clear
   clear
   echo "Instalando firewall "
   apt-get install ufw
   echo "ativando firewall "
   ufw default deny
   ufw enable
   echo " status do firewall"
   ufw status
   ufw status verbose
   apt-get install gufw -y
   clear
   clear
   echo " instalando uma pitada de magia... "
   apt-get install cmatrix chromium firefox midori epiphany  lm-sensors thermald hddtemp conky conky-all conky-manager
   clear
   echo "Instalando pacotes: deepstream, rethinkdb "
   apt-get install rethinkdb -y
   apt-get install -y deepstream.io
   clear
   echo "Instalando virtual box"
   apt-get install virtualbox-5.1 
   gpasswd -a $USER vboxusers
   VBoxManage extpack install --replace *.vbox-extpack
   clear
   curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
   apt-get install -y nodejs
   ln -s /usr/bin/nodejs /usr/bin/node
   clear
    echo "FIM!"
   else
   exit
fi
