
#!/bin/sh

#Nom		: aspireLiens.sh
#Description	: 
#Ex)		: 
#Param 1	: 
#Version	: 1.0.0.1
#Auteur		: dino213dz@gmail.com
#Changelog	: 2019-01-09 03:35:50


################ VARIABLES : ################
url=$1
if [ "$url" = "" ];then
	url="https://ankiweb.net/shared/info/575656891"
	echo -e "Aucune url en parammetre!\nUrl exemple: $url"
fi
resultats_html=`lynx -nonumbers -dump $url|grep "http.*://"`


################ FONCTIONS : ################


################ MAIN PROG : ################
for ligne in $resultats_html
do
	verif_point=$(echo $ligne | sed "s/^.*\(.\{1\}\)$/\1/")
	#echo "pv="$verif_point
	if [ "$verif_point" = "." ];then
	        #echo "point trouvé dans : "$ligne
		ligne=$(echo $ligne|rev|cut -c 2-|rev)
	fi	
	ligne=$(echo $ligne |cut -d " " -f 1|grep ^http)
	if [ "${#ligne}" != "0" ];then
		echo -E $ligne
	fi
done

################ FIN PROG : ################
#echo 'Fin!'



