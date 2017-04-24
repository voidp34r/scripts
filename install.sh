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
    sleep 2
    clear
    echo "Atualizando o sistema..."
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
   apt-get install build-essentials
   aptitude install libavcodec-extra
    aptitude install gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad gstreamer0.10-fluendo-mp3 gstreamer0.10-pulseaudio
   aptitude install libgstreamer-perl libgstreamer-interfaces-perl
   clear
    echo "FIM!"
   else
   exit
fi
