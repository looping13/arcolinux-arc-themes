#!/bin/bash
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	forked from Erik Dubois, a linux hero. Modified by me aka looping13, learning bash
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


# Declare functions
  function rgbfunction () {
  foldcolour1=$1
  fnewcolour1=$2     
  find arc-theme/common -type f -exec sed -i 's/'$foldcolour1'/'$fnewcolour1'/g' {}  \;
  echo "The rgb colour "$foldcolour1 "was changed to " $fnewcolour1
  }

  function rgbafunction () {
  foldcolour1=$1
  fnewcolour1=$2
  find arc-theme/common -type f -exec sed -i "s/$foldcolour1/$fnewcolour1/g" {}  \;
  echo "The rgba colour "$foldcolour1 "was changed to " $fnewcolour1
  }
  
  function rgbhex2dec () {
  #old rgba colour of background rubberband
  oldhex=$1
  redhex=${oldhex:0:2}
  greenhex=${oldhex:2:2}
  bluehex=${oldhex:4:2}
  ###
  reddec=$((16#$redhex))
  greendec=$((16#$greenhex))
  bluedec=$((16#$bluehex))
  ###
  rgbacolour="$reddec, $greendec, $bluedec"
  echo $rgbacolour
  } 

  function makearc {
  # if there is no hidden folder then make one
  [ -d $HOME"/.themes" ] || mkdir -p $HOME"/.themes"
  cp -rf /tmp/at/share/themes/Arc $HOME"/.themes"
  cp -rf /tmp/at/share/themes/Arc-Dark $HOME"/.themes"
  cp -rf /tmp/at/share/themes/Arc-Darker $HOME"/.themes"

  mv $HOME"/.themes/Arc" $HOME"/.themes/Arc-"$choice
  mv $HOME"/.themes/Arc-Dark" $HOME"/.themes/Arc-"$choice"-Dark"
  mv $HOME"/.themes/Arc-Darker" $HOME"/.themes/Arc-"$choice"-Darker"

  echo "################################################################"
  echo "Renaming inside the index.theme"
  echo "Arc-$choice-Darker"
  find $HOME"/.themes/Arc-"$choice"-Darker" -name "index.theme" -type f -exec sed -i 's/'Name=Arc-Darker'/'Name=Arc-$choice-Darker'/g' {}  \;
  find $HOME"/.themes/Arc-"$choice"-Darker" -name "index.theme" -type f -exec sed -i 's/'GtkTheme=Arc-Darker'/'GtkTheme=Arc-$choice-Darker'/g' {}  \;
  find $HOME"/.themes/Arc-"$choice"-Darker" -name "index.theme" -type f -exec sed -i 's/'MetacityTheme=Arc-Darker'/'MetacityTheme=Arc-$choice-Darker'/g' {}  \;
  echo "################################################################"
  echo "Renaming inside the index.theme"
  echo "Arc-$choice-Dark"
  find $HOME"/.themes/Arc-"$choice"-Dark" -name "index.theme" -type f -exec sed -i 's/'Name=Arc-Dark'/'Name=Arc-$choice-Dark'/g' {}  \;
  find $HOME"/.themes/Arc-"$choice"-Dark" -name "index.theme" -type f -exec sed -i 's/'GtkTheme=Arc-Dark'/'GtkTheme=Arc-$choice-Dark'/g' {}  \;
  find $HOME"/.themes/Arc-"$choice"-Dark" -name "index.theme" -type f -exec sed -i 's/'MetacityTheme=Arc-Dark'/'MetacityTheme=Arc-$choice-Dark'/g' {}  \;
  echo "################################################################"
  echo "Renaming inside the index.theme"
  echo "Arc-$choice"
  find $HOME"/.themes/Arc-"$choice -name "index.theme" -type f -exec sed -i 's/'Name=Arc'/'Name=Arc-$choice'/g' {}  \;
  find $HOME"/.themes/Arc-"$choice -name "index.theme" -type f -exec sed -i 's/'GtkTheme=Arc'/'GtkTheme=Arc-$choice'/g' {}  \;
  find $HOME"/.themes/Arc-"$choice -name "index.theme" -type f -exec sed -i 's/'MetacityTheme=Arc'/'MetacityTheme=Arc-$choice'/g' {}  \;
  }

  function hardcoded_array {

array_colors=(
# uncomment rows you don't need
# Original
#[Aqua]=66a8cb
[Blood]=cf0808
#[Botticelli]=82a4b3
#[Casablanca]=fdb95b
[Crimson]=dc143c
[Emerald]=1fa732
#[Evopop]=1685a6
#[Fire]=f68516
#[Froly]=fd7980
#[Havelock]=6ba4e7
#[Hibiscus]=d52f61
#[Mandy]=c93648
#[Mantis]=6aa847
#[Niagara]=42edcc
#[Numix]=ffa726
#[Orchid]=ff7def
#[Paper]=90a4ae
#[Pink]=ce6ca2
#[Polo]=688bc6
#[Punch]=c03645
#[Smoke]=a1a1a1
#[Tacao]=efa369
#[Tory]=596bb0
# CREATIVE
[Tangerine]=FF9500
[Rusty-orange]=E56B1A
#[Red-orange]=FE5100
#[Light-blue-grey]=B8A8BC
#[Azure]=10ADFF
#[Dodger-blue]=2A8DFF
#[Azul]=456CFF
#[Light-salmon]=FFA38D
#[Carnation]=FE6D88
#[Warm-pink]=FD3E84
[Bright-lilac]=CD58FF
#[Light-lime-green]=B5F652
#[Fern]=65B058
#[Medium-blue]=4A71C4
#[Soft-blue]=5481E5
#[Arcolinux-blue]=6790eb
#[Archlinux-blue]=1793D1
#[Sky-blue]=7EC1FF
#[Carolina-blue]=6BA4E7
#[Slate-grey]=636A78
#[Pale-grey]=E1E3E7
#[Light-blue-surfn]=94C2E4
#[Nice-blue]=147EB8
# SKY
#[Blue-sky]=7684A8
#[Dawn]=566282
# Tutorial
#[Blue-sky]=7684A8
#[Vampire]=555A69
)
  }

######################
## Script begins here
######################

##Declare variables
theme_count=0
# declare a key-value pair array
declare -A array_colors


while :
do
  tput setaf 6
  echo "What do you want to do?"
  tput setaf 3
  echo ">>Option 1: Create one theme"
  echo ">>Option 2: Create all themes reading the arc-theme-color-list.txt file"
  echo ">>Option 3: Create all themes using the list hardcoded in the script"
  tput setaf 6
  read -p "Enter option?  (1/2/3): " USER_CHOICE 
  tput setaf 2
  case $USER_CHOICE in
  	1)
  		echo "Option 1 selected"
  		read -p "Enter the theme name (No space):  " tname
		read -p "Enter the hex code: " colourhex
		array_colors[$tname]=$colourhex
  		break
  		;;
  	2)
  		echo "Option 2 selected"
  		if [ -a "./arc-theme-color-list.txt" ] 
  		then 
  			echo "file exists"
	  		while IFS="=" read -r key value
			  do
			    echo $key ${value^^}
			    array_colors[$key]=${value^^}
			  done < <(grep -v '^#' arc-theme-color-list.txt)
			  break
  		else
  			tput bold setaf 1
  			echo -e "ERROR: file does not exist in current directory\nTry again or CTRL+C to exit"
  			tput sgr0
  			  		
  		fi
  		;;
  	3)
  		echo "Option 3 selected"
		# use the array defined in the function
  		hardcoded_array
  		break
  		;;
  	*)
  		tput setaf 1
  		echo "\"$USER_CHOICE\" is not a valid input. Try again or CTRL+C to exit"
  		;;
  esac
done
tput setaf 6
echo "continue script"


# length of the array
echo "let's create "${#array_colors[@]}" new arc themes"

echo "Deleting old files and downloading the latest arc-theme from github"
[ -d arc-theme ] && rm -rf arc-theme
[ -d /tmp/at ] && rm -rf /tmp/at
echo "Downloading the latest arc-theme from github"
tput sgr0
git clone https://github.com/jnsh/arc-theme
tput setaf 6
echo "Preparing theme for color fixes"
tput setaf 3
# change all rgb colours
count=0
oldcolour="5294E2"
foldcolour=$(rgbhex2dec "$oldcolour")  #"82, 148, 226"
# 
declare -a old_rgb=( "5294e2" "4a85cb" "4DADD4" "76c0de" "2e96c0" "2679db" )
declare -a old_rgba=( "38, 121, 219" "82, 148, 226" "65, 137, 223" )
length_a=${#old_rgb[@]}
## Array Loop
for i in "${!old_rgb[@]}"
do 
  echo "Fix" $(($i+1)) "${old_rgb[$i]}" "->" "$oldcolour"
  rgbfunction "${old_rgb[$i]}" "$oldcolour"
done
## Array Loop
for i in "${!old_rgba[@]}"
do 
  echo "Fix" $(($i+1+$length_a)) "${old_rgba[$i]}" "->" "$foldcolour"
  rgbafunction "${old_rgba[$i]}" "$foldcolour"
done

# let's process the list by color name in alphabetical order
declare -a array_keys
readarray -t array_keys < <(printf '%s\n' "${!array_colors[@]}" | sort)

for m in "${array_keys[@]}"
  do

  choice=$m
  newcolour=${array_colors[$m]^^}
  fnewcolour=$(rgbhex2dec $newcolour)
  theme_count=$[theme_count+1]

  tput setaf 1
  echo "Start Creation of theme nr : " $theme_count
  echo "Start Creation of theme name : " $choice
  echo "Using this color : " $newcolour "$fnewcolour"
  tput sgr0
  #############################################
  #changing all blue colours
  #############################################
  tput setaf 2
  # change all rgb colours
  echo "Fix rgb "
  rgbfunction $oldcolour $newcolour

  echo "Fix rgba "
  rgbafunction "$foldcolour" "$fnewcolour"

  # set for next loop
  oldcolour=$newcolour
  foldcolour="$fnewcolour"

  echo "#####################################################################"
  echo "Build starts"
  echo "#####################################################################"
  tput sgr0

  cd arc-theme
  [ -d build ] || mkdir build
  tput setaf 6; echo "setup starts"; tput sgr0
  meson setup --prefix=/tmp/at build/
  tput setaf 6; echo "configure starts"; tput sgr0  
  meson configure --prefix=/tmp/at build/ >/dev/null
  tput setaf 6; echo "install starts"; tput sgr0
  meson install -C build/ | grep '^\['
  cd ..

  tput setaf 6
  echo "#####################################################################"
  echo -e "build completed\nInstalling in current user directory"
  echo "#####################################################################"
  makearc

  echo "#####################################################################"
  echo "Cleaning tmp"
  echo "#####################################################################"
  rm -rf /tmp/at/{Arc,Arc-Darker,Arc-Dark}

  tput setaf 1
  echo "#####################################################################"
  echo "End creation of theme nr : " $theme_count
  echo "End creation of theme name : " $choice
  echo "#####################################################################"
  tput sgr0

done;
echo "#####################################################################"
echo "arc color theme creation script completed"
echo "#####################################################################"
