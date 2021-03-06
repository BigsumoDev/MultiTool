#!/bin/bash
# Multi Tool | Install Server Application
# Devolvement by BigsumoDev - Studio4Gamer.de
#E-Mail = bigsumo@studio4gamer.de
Instversion="1.0.0"

#Informecho 
echo "Der Script ist noch nicht Funktionsfähig"
sleep 5
#####################################################
#Variabel
question="Installation wirklich starten ?"
error="Falscher Parameter, bitte wiederhole die Eingabe"
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
  exit 1
}
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
  errorExit "Script ist veraltet ${Instversion}. Upgrade auf ${LATEST_VERSION}."
  sleep 2
else
  greenMessage "Script ist Aktuell."
  sleep 2
fi
####################################################
#Wichtige Software Installieren
clear
echo "Wenn die Auswahl nicht mit (J) bestätigt wird, wird der Script Automatisch Beendet."
read -p  "Es werden noch pakte für die funktion des Scripts benötigt. Installieren ? j/n : " paket
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
greenMessage "#         Multi Tool ver.1.0.0       #"
greenMessage "#            by BigsumoDev           #"
greenMessage "#                                    #"
greenMessage "######################################"
echo
greenMessage "Die Funktionen sind noch nicht Inplamentiert"
redMessage "1. TeamSpeak 3"
redMessage "2. TS3-Musik Bot"
redMessage "3. Webspace"
redMessage "3. None"
redMessage "4. None"
#######################################################
#Installationen
echo
	read -p "Was soll installiert werden?:" kommando
		case "$kommando" in
			1)  clear ##TeamSpeak Installation##
				echo ""
				echo "TeamSpeak Installer wird gestartet..."
				sleep 2
					echo ""
					read -p "Wo soll Teamspeak Installiert werden: (/home/ts3) :  " pfad
					if [ $pfad == * ]
					then
						sudo mkdir $pfad
						cd $pfad
					else
						sudo mkdir /home/ts3t
						cd /home/ts3t
					fi
					echo Teamspeak wird gedownlodet...
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
			2) 	clear ##TS3-Musik Bot Installer##
					echo ""
					echo "Der Musikbot Installer"
					echo "Wird gestartet..."
					sleep 2
						echo ""
						read -p "Hab sie TeamSpeak installiert? (j/n) ?:" tsbot
						if [ $tsbot == j ]
						then
							clear
							read -p "Wo wollen sie denn Bot Installiert haben? (Standart: /home/..)  :" tsbot
							if [ $tsbot == *]
								then
								sudo mkdir $tsbot
								cd $tsbot
							else
								sudo mkdir /home/ts3bot
								cd /home/ts3bot
							fi
						else
							break
						fi
				break
			;;
			3) echo "Webspace Installation wird gestartet ..."
				break
			;;
			*) echo "Unbekannter Parameter"
				sleep 1
			;;
	esac
done


####################################################
#Ende
echo "Danke für die Benutzung von Multi Tool"
