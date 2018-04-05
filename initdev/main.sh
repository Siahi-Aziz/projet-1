# !/ bin / bash
if [ $# -gt 0 ] && [ $# -lt 5 ];then #test si le nombre d'arguments est entre 1 et 5
if [ "$1" = "-GPL" ] || [ "$1" = "-MIT" ] || [ "$1" = "-git" ] || [ "$1" = "-C" ] || [ "$1" = "-Cpp" ] || [ "$1" = "-C++" ] || [ "$1" = "-Py" ] || [ "$1" = "-Latex" ] || [ "$1" = "-BEAMER" ] ;then
echo "Erreur:il faut que le nom du projet etre le premier argument  voir initdev -help pour aide vous "
else
if [ $# -eq 0 ];then  #test si le nbr d'arguments = 0 , si vrai retourne erreur 
	echo "Expected arguments, please check the help : initdev –help" 
	elif [ $# -eq 1 ];then #test 1 arguemts  
	
	
	
	if [ "$1" = "-Name" ];then # donc créer la commande -Name
		echo " 	Nom de l'app : initdev ";
		echo " Description :l'application  permet de créer un projet initialisé avec un depot git en remplir un fichier de base , une lisence /un makefile / .gitignore tellque en sélectionnez  un nom  un language (c,c++,..) , une liscence en entrées : voir initdev -args pour voir les argument ";
		elif [ "$1" = "-help" ];then # créer  la commande -help
		echo "Arguments:" ;
		echo "-Name : Afficher le nom de l’application .";
		echo "-Syntax : Afficher la syntaxe de commande initdev."
		echo "-args : Lister les arguments et donner une description de chaque argument.";
		echo "-author : Afficher le nom et l’email de l’auteur de l’application."; 
		elif [ "$1" = "-Syntax" ];then # créer  la commande -Syntax
		echo "Syntaxes d'utilisations: "
		echo " syntaxe 1 : initdev [commande : -help , -Name , -Syntax , -args , -author ] ";
		echo " syntaxe 2: initdev [nom] ";
		echo " syntaxe 3: initdev [nom] [langage/licence]";
		echo " syntaxe 4: initdev [nom] [langage/licence/git] [langage/licence/git]";
		echo " syntaxe 5: initdev [nom] [langage/licence/git] [langage/licence/git] [langage/licence/git]";
		echo "Conditions d'utilisations:
1)  1er argument dans toute les syntaxes doit etre le nom de projet
2) dans la meme commande Vous pouvez ecrire le meme argument une seul fois 
3)  Vous pouvez créer un projet sans la precision de  license , langage voir 1ere syntaxe 
2)  vous pouvez créer un projet avec une licence que vous voulez sans precision  le langage voir 2eme syntaxe
3) vous pouvez créer un projet avec une licence et un langage spécifié voir 3eme syntaxe 
4) vous pouvez créer un projet avec un depot git mais vous devez preciser le langage voir 3eme syntaxe 
5) vous pouvez créer un projet avec une licence , un langage specifique plus un depot initiale git voir 4eme syntaxe    "
		elif [ "$1" = "-args" ];then # créer  la commande -args
		echo " 
-Arguments * unicité d'argument ( vous ne pouvez pas utiliser  )
-help	*	affiche l'aide
-Name	*	affiche le nom de l'application 
-Syntax	*	affiche les syntaxes d'utilisation de la commande
-args	*	affiche tous les arguments 
-author	*	affiche le nom et l'e-mail de l'auteur de l'application
-C		Projet en langage C
-Py		Projet en langage Python
-Cpp ou -C++	Projet en langage C++ 
-Latex		Projet d' ecriture en Latex
-BEAMER		Projet d' ecriture en BEAMER
-GPL		Projet avec une licence GENERAL PUBLIC LICENSE
-MIT		Projet avec une licence MIT
-git		créer  un fichier .gitignore et un depot git dans le repertoire du projet"
		elif [ "$1" = "-author" ];then # créer  la commande -author
		echo "Auteur: siahi abdelaziz "
		echo "E-mail: abdelazizsiahi@gmail.com"
		else # Creation d'un projet sans licence ou langage specifique
		mkdir "$1"
		touch "$1"/main
		touch "$1"/LICENSE  
		touch "$1"/makefile 
		fi
	else
	if [ $# -eq 2 ];then #test si le nombre d'arguments = 2 
		if [ "$2" = "-C" ];then # Créer un projet en langage C sans licence choisir
			mkdir "$1" ;
			cp  home/"$USER"/.initdev/sources/main.c "$1"/ 
			touch "$1"/LICENSE ;
			touch "$1"/Makefile ;
			elif [ "$2" = "-CPP" ] || [ "$2" = "-C++" ] ;then # Créer un projet en langage C++ sans licence choisir
				mkdir "$1" ;
				cp home/"$USER"/.initdev/sources/main.cpp "$1"/ 
				touch "$1"/LICENSE ;
				touch "$1"/Makefile ;
			elif [ "$2" = "-Py" ];then # Créer un projet en langage Python sans licence choisir
				mkdir "$1" ;
				cp /home/"$USER"/.initdev/sources/main.py "$1"/ 
				touch "$1"/LICENSE ;
				touch "$1"/Makefile ;
			elif [ "$2" = "-Latex" ];then  # Créer un Projet d'ecriture en Latex sans licence choisir
				mkdir "$1" ;
				cp /home/"$USER"/.initdev/sources/latexMin.tex "$1"/
				mv "$1"/latexMin.tex "$1"/Main.tex
				touch "$1"/LICENSE ;
				touch "$1"/Makefile ;
			elif [ "$2" = "-BEAMER" ];then # Créer un Projet d'ecriture en BEAMER sans licence choisir
				mkdir "$1" ;
				cp /home/"$USER"/.initdev/sources/beamer.tex "$1"/
				mv "$1"/beamer.tex "$1"/Main.tex
				touch "$1"/LICENSE ;
				touch "$1"/Makefile ;
			elif [ "$2" = "-GPL" ];then # Créer un Projet avec une licence GPL sans un langage choisir
				mkdir "$1" ; 
				touch "$1"/main ;
				cp /home/"$USER"/.initdev/licenses/GPL "$1"/
				mv "$1"/GPL "$1"/LICENSE
				touch "$1"/Makefile ;
			elif [ "$2" = "-MIT" ];then # Créer un Projet avec une licence MIT sans un langage choisir
				mkdir "$1" ; 
				touch "$1"/main ;
				cp /home/"$USER"/.initdev/licenses/MIT "$1"/
				mv "$1"/MIT "$1"/LICENSE
				touch "$1"/Makefile ;
			fi 
			
		elif [ $# -eq 3 ];then #test si le nombre d'arguments = 3 , cette commandes garantie de garde le même ordre nom > langage >licence/-git  
		arg2="$2"
		arg3="$3"
				if [ "$2" = "$3" ];then
					echo " repetitions d'arguments  "
					elif [ "$2" = "-GPL" ] || [ "$2" = "-MIT" ] || [ "$2" = "-git" ] || [ "$3" = "-C" ] || [ "$3" = "-Cpp" ] || [ "$3" = "-C++" ] || [ "$3" = "-Py" ] || [ "$3" = "-Latex" ] || [ "$3" = "-BEAMER" ]  ;then
					arg2="$3"
					arg3="$2"
				fi 
				
		elif [ $# -eq 4 ] ; then #test si le nombre d'arguments est égal à 4 , on garde toujours le meme ordre nom > langage >licence >-git dans l'algorithme sans qu'on oblige l'utilisateur a respecter l'ordre 
		arg2="$2"
		arg3="$3"
		arg4="$4"
		if [ "$2" = "$3" ] || [ "$2" = "$4" ] || [ "$4" = "$3" ];then
			echo " repetitions d'arguments  "
			else
			if [ "$2" = "-GPL" ] || [ "$2" = "-MIT" ]  ;then
				arg3="$2"
				else
				if [ "$2" = "-git" ];then
					arg4="$2";
				fi
			fi
		if [ "$3" = "-C" ] || [ "$3" = "-Cpp" ] || [ "$3" = "-C++" ] || [ "$3" = "-Py" ] || [ "$3" = "-Latex" ] || [ "$3" = "-BEAMER" ];then	
			arg2="$3"
			else
			if [ "$3" = "-git" ];then
				arg4="$3"
			fi
		fi
		if [ "$4" = "-C" ] || [ "$4" = "-Cpp" ] || [ "$4" = "-C++" ] || [ "$4" = "-Py" ] || [ "$4" = "-Latex" ] || [ "$4" = "-BEAMER" ];then
			arg2="$4"
			elif [ "$4" = "-GPL" ] || [ "$4" = "-MIT" ]; then
			arg3="$4"
		fi
		fi
		mkdir "$1" ;
		if [ "$arg2" = "-C" ];then
				
			cp  /home/"$USER"/.initdev/sources/main.c "$1"/ 
			elif [ "$arg2" = "-Cpp" ] || [ "$arg2" = "-C++" ];then
			cp /home/"$USER"/.initdev/sources/main.cpp "$1"/
			elif [ "$arg2" = "-Py" ];then
			cp /home/"$USER"/.initdev/sources/main.py "$1"/
			elif [ "$arg2" = "-Latex" ];then
						
			cp /home/"$USER"/.initdev/sources/latexMin.tex "$1"/
			mv "$1"/latexMin.tex "$1"/Main.tex
			elif [ "$arg2" = "-BEAMER" ];then
						
			cp /home/"$USER"/.initdev/sources/beamer.tex "$1"/
			mv "$1"/beamer.tex "$1"/Main.tex
			
			
		fi
			if [ "$arg3" = "-GPL" ];then
				cp /home/"$USER"/.initdev/licenses/GPL "$1"/
				mv "$1"/GPL "$1"/LICENSE
				touch "$1"/Makefile ;
				elif [ "$arg3" = "-MIT" ];then
					cp /home/"$USER"/.initdev/licenses/MIT "$1"/
					mv "$1"/MIT "$1"/LICENSE
					touch "$1"/Makefile ;
				
			fi
			if [ "$arg4" = "-git" ] ;then

						if [ "$arg2" = "-C" ];then

                                                         cd "$1"/ git init
							touch "$1"/LICENSE
							touch "$1"/makefile
							cp /home/"$USER"/.initdev/gitignores/c "$1"/
							mv "$1"/c "$1"/.gitignores
							elif [ "$arg2" = "-Cpp" ] || [ "$arg2" = "-C++" ] ||[ "$arg2" = "-Py" ];then
								cd "$1"/
								git init
								cd ../
								touch "$1"/LICENSE
								touch "$1"/makefile
								cp /home/"$USER"/.initdev/gitignores/"cpp" "$1"/
								mv "$1"/"cpp" "$1"/.gitignore
                                                                cp /home/"$USER"/.initdev/gitignores/python "$1"/
                                                                mv "$1"/python "$1"/.gitignore

							elif [ "$arg2" = "-Latex" ] || [ "$arg2" = "-BEAMER" ];then
								cd "$1"/
								git init
								cd ../
								touch "$1"/LICENSE
								touch "$1"/makefile
								cp /home/"$USER"/.initdev/gitignores/tex "$1"/
								mv "$1"/tex "$1"/.gitignore
						
						fi
						else
						echo "check the help : initdev –help" ;
						
						if [ -d $1 ]; then
							rm -r $1
						fi
			
fi
fi
if [ $# -gt 1 ];then
if [ "$1" = "-help" ] || [ "$1" = "-Name" ] || [ "$1" = "-args" ] || [ "$1" = "-author" ] || [ "$1" = "-Syntax" ];then
echo "beaucoups trops d'arguments ou incunn, voir initdev -help , initdev -args ou initdev -Syntax" 
fi
fi			
			
	
 

