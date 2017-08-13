#!/bin/bash
# Multi Tool | Install Software & Games
# Devolvement by Bigsumo - Studio4Gamer.de bigsumo@studio4gamer.de
Instversion="1.0"
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
#Script Update Abfrage // keine Funktion (in Arbeit)
clear
LATEST_VERSION=$(wget --no-check-certificate --timeout=60 -qO - https://raw.githubusercontent.com/BigsumoDev/MultiTool/master/multi_tool.sh | grep -Po '(?<=Instversion=")([0-9]\.[0-9]\.[0-9]+)')
echo "Script Update v.1.0"
read -p  "Script Update ? j/n : " ScriptUpdate
if [ $ScriptUpdate == j ]
 then
   if [ "$(printf "${LATEST_VERSION}\n${Instversion}" | sort -V | tail -n 1)" != "$Instversion" ]; then
     errorExit "Outdated installer ${Instversion}. Upgrade your installer to version ${LATEST_VERSION}. Or reuse https://sinusbot-installer.de"
   else
     greenMessage "Your installer is up-to-date."
     sleep 1
   fi
else
  echo "gut"
fi
sleep 2
####################################################
#Wichtige Software Installieren --Variabel abfrage
clear
echo "Die auswahl (N) führt zum Abbruch des Scripts. "
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
greenMessage "################################"
greenMessage "#                              #"
greenMessage "#                              #"
greenMessage "#      Multi Tool ver.1.0      #"
greenMessage "#          by Bigsumo          #"
greenMessage "#                              #"
greenMessage "#                              #"
greenMessage "################################"
echo
echo "1. TeamSpeak Installer"
echo "2. TS3-Musik Bot Installer"
echo "3. Webspace full Installation"
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
					read -p "Wollen sie denn TeamSpeak hochfahren (j/n)? :" ts3
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
