#!/bin/bash
# Multi Tool | Install Server Application
# Devolvement by BigsumoDev - Studio4Gamer.de
#E-Mail = bigsumo@studio4gamer.de
#
# Script is dont be done
Instversion="1.0.0"
Build="Pre-Build-1"

#####################################################
#################--Funktionen--######################
#Color
function greenMessage {
  echo -e "\\033[32;1m${*}\033[0m"
}
function redMessage {
  echo -e "\\033[31;1m${*}\033[0m"
}
#Funktionen
function errorEingabe {
  redMessage "Falsche Eingabe."
  return
}
function errorExit {
  redMessage "${@}"
}

## Evt. Shell Oberfläche Per Function Für Mehrfaches Aufrufen.
##
##
####################################################
#Update/Upgrade - Muss noch überarbeitet werden.
clear
echo
greenMessage "Multi Tool | Install Software & Games - by Bigsumo"
echo
read -p "System auf Auktuallisirung prüfen (Empfohlen)(j/n) " kommando;
if [ $kommando == j ]
  then
	echo "Update wird gestartet..."
	apt-get update
	apt-get upgrade
    echo "Ok, system ist auf dem Neustenstand."
  else
	echo "Update System wird übersprungen."
fi
sleep 2
####################################################
#Script Update Abfrage // nur abfrage | Auto Update ist noch geplannt
clear
LATEST_VERSION=$(wget --no-check-certificate --timeout=60 -qO - https://raw.githubusercontent.com/BigsumoDev/MultiTool/master/multi_tool.sh | grep -Po '(?<=Instversion=")([0-9]\.[0-9]\.[0-9]+)')
echo "Scipt Version Check"
if [ "$(printf "${LATEST_VERSION}\n${Instversion}" | sort -V | tail -n 1)" != "$Instversion" ]; then
  errorExit "Script ist veraltet ${Instversion}. Update auf ${LATEST_VERSION}."
  sleep 1
  read -p "Wollen sie Updaten (j/n) ?" githube
    if [ $githube == j ]
      then wget -N https://raw.githubusercontent.com/BigsumoDev/MultiTool/master/multi_tool.sh
      sleep 2
      clear
      bash multi_tool.sh
    else
      clear
      redMessage "Für die beste Funktionen, ist immmer die akktuellste Version die Beste Wahl. [Auf eigene verantwortung]"
      sleep 2
    fi
  else
    clear
    greenMessage "Die Version $Instversion ist die Akktuellste."
    sleep 2
  fi
####################################################
#Wichtige Software Installieren
clear
echo "Info: Bei Ablehnung des Pakets wird das Script geschlossen!."
read -p  "Wichtige Pakete Installieren? j/n : " paket
if [ $paket == j ]
 then apt-get install sudo tar unzip screen
else
  set -e
fi
####################################################
# Die Auswahl oberfläche
while true
  do
	clear
greenMessage "######################################"
greenMessage "#                                    #"
greenMessage "#         Multi Tool ver.$Instversion       #"
greenMessage "#            by BigsumoDev           #"
greenMessage "#                                    #"
greenMessage "#               $build          #"
greenMessage "######################################"
echo
greenMessage "Die Funktionen sind noch nicht Inplamentiert"
redMessage "1. TeamSpeak 3 |- In Bearbeitung"
redMessage "2. TS3-Musik Bot |- In Bearbeitung"
redMessage "3. Webspace |- In Bearbeitung"
redMessage "3. Mailserver |- In Bearbeitung"
redMessage "4. GamingServer |- In Bearbeitung"
redMessage "Mehr wird noch kommen!"
#######################################################
#Installationen
echo
	read -p "Bitte geben sie eine Zahl ein(1-4). Um die Installation zu Starten ?:" kommando
		case "$kommando" in
#####################TeamSpeak Installation ####################################
			1)  clear
				echo ""
				echo "TeamSpeak Installer wird gestartet..."
				sleep 2
          read -p "Soll ein User für die Anwendung Erstellt werden (J/N)?." create;
            if [ $create == j ]; then
              read -p "Wie soll der User Heißen? = " name;
              adduser $name
              su $name
            else
              echo "Programm Ende"
            fi
					echo ""
					read -p "Wo soll Teamspeak Installiert werden: (Standart: /home/ts3). : " inst;
					if [ $inst == * ]
					then
						sudo mkdir $inst
						cd $inst
					else
						sudo mkdir /home/ts3
						cd /home/ts3
					fi
					echo Teamspeak wird Heruntergeladen...
					sleep 1
					wget http://dl.4players.de/ts/releases/3.0.13.8/teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2
					clear
					echo "TeamSpeak wird entpackt..."
					tar -xjf teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2
					cd teamspeak3-server_linux_amd64
					clear
					read -p "Willst du denn TeamSpeak Starten (j/n)? :" ts3
					if [ $ts3 == j ]
						then ./ts3server_startscript.sh start
						echo "ts3 gestartet"
					else
					 echo "Test"
					fi
					echo "done"
				break
			;;
################### TeamSpeak Musikbot #########################################
			2) 	clear
			;;
################### Webspace Installation ######################################
			3) clear
      wTitel="WebSpace Installer v.1.0" #Variabel
        echo $wTitel
        read -p "Handelt es sich um eine Installation/Deinstallation (i/d)" webspace
          if [[ $webspace == i ]]; then
            clear
            echo $wTitel
            echo
            read -p "Wollen sie Wirklich WebSpace Installieren(j/n)" install
              if [[ $install = j ]]; then
                clear
                sudo apt-get install apache2 php5 libapache2-mod-php5
                greenMessage "Webspace wurde installiert"
                sleep 1
                echo "MySQL wird Installiert..."
                sleep 2
                sudo  apt-get install mysql-server mysql-client php5-mysql
                greenMessage "MySQL wurde Installiert"
                break
              else
                echo "Test"
                sleep 2
              fi
              break
          elif [[ $webspace == d ]]; then
            clear
            echo $wTitel
            echo
            read -p "Wollen sie Wirklich WebSpace Deinstallieren "
            sleep 1
          else
            set -e
          fi
			;;
################## Falsche Angabe ##############################################
			*) redMessage "Unbekannter Parameter"
				sleep 1
			;;
	esac
done
################################################################################
#Ende
echo "Danke für die Benutzung von Multi Tool"
pause 1
exit
