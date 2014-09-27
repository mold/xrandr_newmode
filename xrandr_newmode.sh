#!/bin/bash

cvtOut="$(cvt 1024 768 $2)"

# http://stackoverflow.com/questions/19771965/split-bash-string-by-newline-characters
readarray -t Modeline <<< "$cvtOut"
#IFS=$'\n' STUFF=($cvtOut)

for i in "${Modeline[@]}"; do
    echo $i
done

Modeline=${Modeline[1]:8}
name=${Modeline:2:14}

`xrandr --newmode $Modeline`
`xrandr --addmode $1 $name`
`xrandr --output $1 -s $name`

# regex to get name, don't know how to use though :-))
#echo "${Modeline[1]:8}" | grep -P '(?<=")[\w.]+(?=")'

