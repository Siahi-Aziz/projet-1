# !/ bin / bash
b="1"
chemin=$PWD
cheminp=$PWD
cd /home/"$USER"/
if [ -e .initdev ]; then # installation app initdve
	echo " le dossier initdev existe deja "
	n=2
	while [ -e .initdev"$n" ]
		do
		n=$(expr $n + 1)
	done
		mv /home/"$USER"/.initdev /home/"$USER"/.initdev"$n"
			
		echo " le dossier exister il a éte renommé en .initdev$n"
		
fi		 
echo " preparation de l'installation de la commande initdev..."
mkdir /home/"$USER"/.initdev
while [ $b = "1" ] #on teste si nos ressources existe dans le repertoire ou install.sh 
	do
	cd $chemin
	if [ -d gitignores ] && [ -d bin ] && [ -d sources ] && [ -d licenses ] && [ -d makefiles ];then
		echo "Copie des dossiers et fichiers pour  la commande initdev..."
		cp gitignores /home/"$USER"/.initdev/gitignores
		cp bin /home/"$USER"/.initdev/bin
		cp sources  /home/"$USER"/.initdev/Sources 
		cp licenses /home/"$USER"/.initdev/Licences
		cp makefiles /home/"$USER"/.initdev/Makefiles
		b="2"
		else #la demande le chemin des ressources  
		echo "Erreur : Des repertoires ou des fichiers introuvables veuillez indiquer le repertoire 
entrer un chemin (entrer 0 pour arreter l'installation ) :";
		read chemin
		if [ $chemin = "0" ]; then
			rmdir /home/"$USER"/.initdev
			b="0"
			else
			cd "$cheminp"
		fi
	fi
done


