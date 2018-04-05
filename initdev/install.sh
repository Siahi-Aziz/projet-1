# !/ bin / bash
b="1"
chemin=$PWD
cheminp=$PWD
cd /home/"$USER"/
if [ -e .initdev ]; then #si le dossier .inidev existe deja on le renomme pour pouvoir installer notre application .initdev
	echo " le dossier initdev existe deja "
	n=2
	while [ -e .initdev"$n" ]
		do
		n=$(expr $n + 1)
	done
		mv /home/"$USER"/.initdev /home/"$USER"/.initdev"$n"
			
		echo " le dossier deja existant a éte renommé en .initdev$n"
		else
		echo " le dossier initdev n'existe pas "
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
		else #ici on demande le chemin des ressources si on a pas trouver dans le chemin par defaut 
		echo "Erreur : Des repertoires ou des fichiers introuvables veuillez indiquer le repertoire dans lequel les fichiers d'installations de la commande initdev ce trouve , exemple /home/user/download/initdev/
entrer un chemin (entrer 0 pour arreter l'installation ) :"
		read chemin
		if [ $chemin = "0" ]; then
			rmdir /home/"$USER"/.initdev
			b="0"
			else
			cd "$cheminp"
		fi
	fi
done
if [ $b = "2" ];then # ici on teste si il n y a pas eu de problèmes lors de la copie des ressources  
	echo " verification des fichiers..."
	cd /home/"$USER"/.initdev/
	cd gitignores/
	echo "Verification du dossier gitignores"
	if [ -e c ] && [ -e cpp ] && [ -e python ] && [ -e tex ];then
		echo "Dossier gitignores contient l'intigralité des fichiers"
		else
		echo " manque de fichiers au niveau du dossier gitignores"
		b= "0"
	fi
	fi
	cd ../
	cd licenses/
	if [ -e GPL ] && [ -e MIT ];then
		echo "Dossier licenses contient l'intigralité des fichiers"
		else
		echo "manque de fichiers au niveau du dossier gitignores"
		b= "0"
	fi
	cd ../
	cd sources/
	if [ -e main.c ] && [ -e main.cpp ] && [ -e main.py ] && [ -e latexMin.tex ] && [ -e beamer.tex ];then
		echo "Dossier sources contient l'intigralité des fichiers"
		else
		echo "manque de fichiers au niveau du dossier sources"
		b= "0"
	fi


		else
		if [ -e .zshrc ]; then
   			PATH="$PATH:/home/"$USER"/.initdev/"
			export PATH 
			else
			PATH="$PATH:/home/"$USER"/.initdev/"
			export PATH 
		fi
	fi
	echo "la commande initdev installé avec succès"
	else 
	echo " Un problème est survenu durant l'installation d'initdev , veuillez relancez le progrramme d'installation "
fi

