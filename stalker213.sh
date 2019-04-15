#!/bin/sh

#Nom		: Stalker213
#Description	: 
#Ex)		: 
#Param 1	: 
#Version	: 0.0.0.1
#Auteur		: dino213dz@gmail.com
#Changelog	: 2019-01-09 01:02:16


################ VARIABLES : ################
terme=$1
if [ "$terme" = "" ];then
	terme="hack academy"
fi

url="http://www.google.fr/search?q="$terme"&output=pda"

################ FONCTIONS : ################

terme=${terme// /+}

################ MAIN PROG : ################

#Requete Google:
echo -en "\nRecherche Google du terme \"$terme\""
resultat_brut=$(lynx -dump $url)
#echo -en "\033[43;34m $resultat_brut \033[0m"

rx=$(lynx -dump $url|grep "Web Environ")
#echo $rx

resultat_total=$(echo $rx|cut -f 3 -d " ")" en "$(echo $rx|cut -f 5 -d " ")" "$(echo $rx|cut -f 6 -d " ")
#resultat_total=$(lynx -dump $url|grep "Web Environ")
#"Web Environ 627 résultats (0.16 secondes)"
echo -en "\nTotal="$resultat_total"!\n"

#afficher les liens:
liste_liens=$(lynx -nonumbers -dump $url|grep "http://www.google.fr/url?q=")
# "http://www.google.fr/url?q="
numero=0
for l in $liste_liens
do
	numero=$(echo $numero+1|bc)
	echo -en "\n["$numero"] "$(echo $liste_liens | cut -f $numero -d " " )""
done

#recherches youtube:
#afficher les liens Youtube:
liste_yt=$(lynx -nonumbers -dump "https://www.youtube.com/results?search_query="$terme |grep "https://www.youtube.com/watch?v=")
echo -e "\n\nLiens Youtube:"
numero=0
for l in $liste_yt
do
	numero=$(echo $numero+1|bc)
	echo -en "\n["$numero"] "$(echo $liste_yt | cut -f $numero -d " " )""
done


################ FIN PROG : ################
echo -en "\n\n"
echo 'Fin!'
echo -en "\n\n"


