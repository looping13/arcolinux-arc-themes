#!/bin/bash
# generate an html page to display color codes

# declare a key-value pair array
declare -A array_colors

# what themes are we going to create
# https://colorcodes.io
array_colors=(
# Original
[Aqua]=66a8cb
[Blood]=cf0808
[Botticelli]=82a4b3
[Casablanca]=fdb95b
[Crimson]=dc143c
[Emerald]=1fa732
[Evopop]=1685a6
[Fire]=f68516
[Froly]=fd7980
[Havelock]=6ba4e7
[Hibiscus]=d52f61
[Mandy]=c93648
[Mantis]=6aa847
[Niagara]=42edcc
[Numix]=ffa726
[Orchid]=ff7def
[Paper]=90a4ae
[Pink]=ce6ca2
[Polo]=688bc6
[Punch]=c03645
[Smoke]=a1a1a1
[Tacao]=efa369
[Tory]=596bb0
 #CREATIVE
[Tangerine]=FF9500
[Rusty-orange]=E56B1A
[Red-orange]=FE5100
[Light-blue-grey]=B8A8BC
[Azure]=10ADFF
[Dodger-blue]=2A8DFF
[Azul]=456CFF
[Light-salmon]=FFA38D
[Carnation]=FE6D88
[Warm-pink]=FD3E84
[Bright-lilac]=CD58FF
[Light-lime-green]=B5F652
[Fern]=65B058
[Medium-blue]=4A71C4
[Soft-blue]=5481E5
[Arcolinux-blue]=6790eb
[Archlinux-blue]=1793D1
[Sky-blue]=7EC1FF
[Carolina-blue]=6BA4E7
[Slate-grey]=636A78
[Pale-grey]=E1E3E7
[Light-blue-surfn]=94C2E4
[Nice-blue]=147EB8
 #SKY
[Blue-sky]=7684A8
[Dawn]=566282
 #Tutorial
[Blue-sky]=7684A8
[Vampire]=555A69
 #Why Not
  [Lavender]=B2A4D4
  [Lightsaber-green]=2FF924
)

tput setaf 6
# length of the array
echo  "let's create "${#array_colors[@]}" colors in new html document"
declare -a array_key
readarray -t array_key < <(printf '%s\n' "${!array_colors[@]}" | sort)
echo ${array_key[@]}
tput sgr0
echo -e "<!DOCTYPE html>\n<html>\n<body>\n<p>These are the accent colors:</p>" > themes.html


for m in "${array_key[@]}"
  do

  choice=$m
  newcolour=${array_colors[$m]^^}
  echo "<h1 style=\"background-color:#$newcolour;\">$choice (#$newcolour)</h1>" >> themes.html
  
  done;
echo -e "</body>\n</html>" >> themes.html  
