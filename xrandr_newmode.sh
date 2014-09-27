#!/bin/bash
dW="1024"
dH="768"
a=$3
b=$4

cvtOut="$(cvt ${a:-$dW} ${b:-$dH} $2)"

# http://stackoverflow.com/questions/19771965/split-bash-string-by-newline-characters
readarray -t Modeline <<< "$cvtOut"
#IFS=$'\n' STUFF=($cvtOut)

name=${Modeline[1]:10:14}
Modeline=${Modeline[1]:25}

echo $Modeline
echo $name

`xrandr --newmode $name $Modeline`
`xrandr --addmode $1 $name`
`xrandr --output $1 --mode $name`
`xrandr --rmmode $name`

# regex to get name, don't know how to use though :-))
#echo "${Modeline[1]:8}" | grep -P '(?<=")[\w.]+(?=")'

