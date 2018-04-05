# !/ bin / bash
if [ $# -gt 0 ] && [ $# -lt 5 ];then #test si le nombre d'arguments est entre 1 et 5
if [ "$1" = "-GPL" ] || [ "$1" = "-MIT" ] || [ "$1" = "-git" ] || [ "$1" = "-C" ] || [ "$1" = "-Cpp" ] || [ "$1" = "-C++" ] || [ "$1" = "-Py" ] || [ "$1" = "-Latex" ] || [ "$1" = "-BEAMER" ] ;then
echo "Erreur: le premier argument doit être le nom du projet voir initdev -help pour plus d'informations sur l'application "
else
if [ $# -eq 0 ];then  #test si le nombre d'arguments est égal à 0 , on retourne erreur si vrai
	echo "Expected arguments, please check the help : initdev –help" 
	elif [ $# -eq 1 ];then  #test si le nombre d'arguments est égal à 1 
	
	
	
	if [ "$1" = "-Name" ];then # ajout de la commande -Name
		echo " 	Nom de l'appl : initdev ";
		echo " Description : cette application  permet de créer un projet initialisé avec un depot git en greffant un fichier de base , une lisence /un makefile / .gitignore en choisissant un nom  un language , une liscence en entrées : voir initdev -args pour voir les arguments proposé par l'application ";
		elif [ "$1" = "-help" ];then # ajout de la commande -help
		echo "Arguments:" ;
		echo "-Name : Afficher le nom de l’application et une petite description."
		echo "-Syntax : Afficher la syntaxe d’utilisation de la commande initdev."
		echo "-args : Lister les arguments et donner une description de chaque argument."
		echo "-author : Afficher le nom et l’email de l’auteur de l’application." 
		elif [ "$1" = "-Syntax" ];then # ajout de la commande -Syntax
		echo "Syntaxes d'utilisations: "
		echo " syntaxe N°0 : initdev [commande : -help , -Name , -Syntax , -args , -author ] "
		echo "1° syntaxe: initdev [nom] "
		echo "2° syntaxe: initdev [nom] [langage/licence]"
		echo "3° syntaxe: initdev [nom] [langage/licence/git] [langage/licence/git]"
		echo "4° syntaxe: initdev [nom] [langage/licence/git] [langage/licence/git] [langage/licence/git]"
		echo "Conditions d'utilisations:
1) Si vous voulez créer un projet , 1er argument dans toute les syntaxes doit etre le nom de projet
2) dans la meme commande Vous ne   pouvez pas ecrire le meme argument plus d'une fois dans la meme commande
3)  Vous pouvez créer un projet sans preciser ni license ni langage voir 1ere syntaxe 
2)  vous pouvez créer un projet avec une licence que vous voulez sans preciser le langage voir 2eme syntaxe
3) vous pouvez créer un projet avec une licence et un langage spécifié voir 3eme syntaxe ( l'ordre n'est pas important)
4) vous pouvez créer un projet avec un depot git mais vous devez preciser le langage voir 3eme syntaxe (l'ordre n'est pas important )
5) vous pouvez créer un projet avec une licence , un langage specifique plus un depot initiale git voir 4eme syntaxe ( l'ordre n'est pas important )   "
		elif [ "$1" = "-args" ];then # ajout de la commande -args
		echo "Arguments : 
* signifie que c'est un argument unique ( vous ne pouvez pas utiliser d'autres arguments en meme temps )
-help	*	affiche l'aide
-Name	*	affiche le nom de l'application 
-Syntax	*	affiche les syntaxes d'utilisation de la commande
-args	*	affiche tous les arguments possible pour l'application
-author	*	affiche le nom et l'e-mail de l'auteur de l'application
-C		Projet en langage C
-Py		Projet en langage Python
-Cpp ou -C++	Projet en langage C++ 
-Latex		Projet de rédaction en Latex
-BEAMER		Projet de rédaction en BEAMER
-GPL		Projet avec une licence GENERAL PUBLIC LICENSE
-MIT		Projet avec une licence MIT
-git		ajoute un fichier .gitignore et un depot git dans le repertoire du projet"
		elif [ "$1" = "-author" ];then # ajout de la commande -author
		echo "Auteur: siahi abdelaziz "
		echo "E-mail: abdelazizsiahi@gmail.com"
		else # Creation d'un projet sans licence ou langage specifique
		mkdir "$1"
		touch "$1"/main
		touch "$1"/LICENSE  
		touch "$1"/makefile 
		fi
	else
	if [ $# -eq 2 ];then #test si le nombre d'arguments est égal à 2 
		if [ "$2" = "-C" ];then # Creation d'un projet en langage C sans licence specifique
			mkdir "$1" ;
			cp  home/"$USER"/.initdev/sources/main.c "$1"/ 
			touch "$1"/LICENSE ;
			touch "$1"/Makefile ;
			elif [ "$2" = "-CPP" ] || [ "$2" = "-C++" ] ;then # Creation d'un projet en langage C++ sans licence specifique
				mkdir "$1" ;
				cp home/"$USER"/.initdev/sources/main.cpp "$1"/ 
				touch "$1"/LICENSE ;
				touch "$1"/Makefile ;
			elif [ "$2" = "-Py" ];then # Creation d'un projet en langage Python sans licence spécifique
				mkdir "$1" ;
				cp /home/"$USER"/.initdev/sources/main.py "$1"/ 
				touch "$1"/LICENSE ;
				touch "$1"/Makefile ;
			elif [ "$2" = "-Latex" ];then  # Creation d'un Projet de rédaction en Latex sans licence spécifique
				mkdir "$1" ;
				cp /home/"$USER"/.initdev/sources/latexMin.tex "$1"/
				mv "$1"/latexMin.tex "$1"/Main.tex
				touch "$1"/LICENSE ;
				touch "$1"/Makefile ;
			elif [ "$2" = "-BEAMER" ];then # Creation d'un Projet de rédaction en BEAMER sans licence spécifique
				mkdir "$1" ;
				cp /home/"$USER"/.initdev/sources/beamer.tex "$1"/
				mv "$1"/beamer.tex "$1"/Main.tex
				touch "$1"/LICENSE ;
				touch "$1"/Makefile ;
			elif [ "$2" = "-GPL" ];then # Creation d'un Projet avec une licence GPL sans un langage spécifique
				mkdir "$1" ; 
				touch "$1"/main ;
				cp /home/"$USER"/.initdev/licenses/GPL "$1"/
				mv "$1"/GPL "$1"/LICENSE
				touch "$1"/Makefile ;
			elif [ "$2" = "-MIT" ];then # Creation d'un Projet avec une licence MIT sans un langage spécifique
				mkdir "$1" ; 
				touch "$1"/main ;
				cp /home/"$USER"/.initdev/licenses/MIT "$1"/
				mv "$1"/MIT "$1"/LICENSE
				touch "$1"/Makefile ;
			fi 
			
		elif [ $# -eq 3 ];then #test si le nombre d'arguments est égal à 3 , le but des commandes  est ne pas trops saturer le script ,on garde le même ordre nom > langage >licence/-git  dans l'algorithme sans  respecter l'ordre , arg2: represente le langage , arg3: la licence ou -git
		arg2="$2"
		arg3="$3"
				if [ "$2" = "$3" ];then
					echo " repetitions d'arguments interdits "
					elif [ "$2" = "-GPL" ] || [ "$2" = "-MIT" ] || [ "$2" = "-git" ] || [ "$3" = "-C" ] || [ "$3" = "-Cpp" ] || [ "$3" = "-C++" ] || [ "$3" = "-Py" ] || [ "$3" = "-Latex" ] || [ "$3" = "-BEAMER" ]  ;then
					arg2="$3"
					arg3="$2"
				fi 
				mkdir "$1" ; #on crée un dossier d'abord mais on le supprime dès qu'il y a une erreur après , le but et toujours ne pas saturer le script  , si il ya un erreur le script supprime automatique le dossier deja crée 
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
					else
					echo "You must set project type, please check the help : initdev -help";					
				fi
				if [ "$arg3" = "-GPL" ];then
					cp /home/"$USER"/.initdev/licenses/GPL "$1"/
					mv "$1"/GPL "$1"/LICENSE
					touch "$1"/Makefile ;
					elif [ "$arg3" = "-MIT" ];then
						cp /home/"$USER"/.initdev/licenses/MIT "$1"/
						mv "$1"/MIT "$1"/LICENSE
						touch "$1"/Makefile ;
					elif [ "$arg3" = "-git" ] ;then

						
						if [ "$arg2" = "-C" ];then
							cd "$1"/
							git init
							cd ../
							touch "$1"/LICENSE
							touch "$1"/makefile
							cp /home/"$USER"/.initdev/gitignores/c "$1"/
							mv "$1"/c "$1"/.gitignores
							elif [ "$arg2" = "-Cpp" ] || [ "$arg2" = "-C++" ];then
								cd "$1"/
								git init
								cd ../
								touch "$1"/LICENSE
								touch "$1"/makefile
								cp /home/"$USER"/.initdev/gitignores/"cpp" "$1"/
								mv "$1"/"cpp" "$1"/.gitignore
							elif [ "$arg2" = "-Py" ];then
								cd "$1"/
								git init
								cd ../
								touch "$1"/LICENSE
								touch "$1"/makefile
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
						echo "Uknown arguments, please check the help : initdev –help" ;
						if [ -d $1 ]; then
						rm -r $1
						fi
					fi
					echo  $arg2 $arg3
		elif [ $# -eq 4 ] ; then #test si le nombre d'arguments est égal à 4 , on garde toujours le meme ordre nom > langage >licence >-git dans l'algorithme sans qu'on oblige l'utilisateur a respecter l'ordre ,arg2: represente le langage , arg3: la licence , arg4: -git
		arg2="$2"
		arg3="$3"
		arg4="$4"
		if [ "$2" = "$3" ] || [ "$2" = "$4" ] || [ "$4" = "$3" ];then
			echo " repetitions d'arguments interdits "
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
			else
			echo "You must set project type, please check the help : initdev -help";
			
		fi
			if [ "$arg3" = "-GPL" ];then
				cp /home/"$USER"/.initdev/licenses/GPL "$1"/
				mv "$1"/GPL "$1"/LICENSE
				touch "$1"/Makefile ;
				elif [ "$arg3" = "-MIT" ];then
					cp /home/"$USER"/.initdev/licenses/MIT "$1"/
					mv "$1"/MIT "$1"/LICENSE
					touch "$1"/Makefile ;
				else "unknown license type, project set to be without specified license ,check the help for more infos  : initdev -help" 
			fi
			if [ "$arg4" = "-git" ] ;then

						if [ "$arg2" = "-C" ];then
							cd "$1"/
							git init
							cd ../
							touch "$1"/LICENSE
							touch "$1"/makefile
							cp /home/"$USER"/.initdev/gitignores/c "$1"/
							mv "$1"/c "$1"/.gitignores
							elif [ "$arg2" = "-Cpp" ] || [ "$arg2" = "-C++" ];then
								cd "$1"/
								git init
								cd ../
								touch "$1"/LICENSE
								touch "$1"/makefile
								cp /home/"$USER"/.initdev/gitignores/"cpp" "$1"/
								mv "$1"/"cpp" "$1"/.gitignore
							elif [ "$arg2" = "-Py" ];then
								cd "$1"/
								git init
								cd ../
								touch "$1"/LICENSE
								touch "$1"/makefile
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
						echo "Uknown arguments, please check the help : initdev –help" ;
						echo "Vous avez mis 4 arguments l'un d'eux doit contenir au moins -git , voir init -help pour plus d'informations " ;
						if [ -d $1 ]; then
							rm -r $1
						fi
			fi
					
		else 
		echo "Beaucoup d'arguments ! ";
				fi fi
		
		fi 
else
if [ $# -eq 0 ];then
	echo "Expected arguments, please check the help : initdev –help" 
else
echo "trops d'arguments en entré , maximum 4 voir: initdev -help ou initdev -syntax"
fi
fi
if [ $# -gt 1 ];then
if [ "$1" = "-help" ] || [ "$1" = "-Name" ] || [ "$1" = "-args" ] || [ "$1" = "-author" ] || [ "$1" = "-Syntax" ];then
echo "beaucoups trops d'arguments ou incunn, voir initdev -help , initdev -args ou initdev -Syntax" 
fi
fi			
			
	
 

