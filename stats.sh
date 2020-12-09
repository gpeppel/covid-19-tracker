#!/bin/bash

pySRC="/var/www/html/py/"
tempSRC="/var/www/html/temp/"
FILENAME=$1

for ((i=1;; i++)); do
    read "URL$i" || break;
done < $FILENAME
echo "$URL1"
echo "$URL2"

fname1=page1.html
fname2=page2.html
pname=parser.py
pyparse="$pySRC$pname"
running=1
updateCounter=0

get1="wget -O $tempSRC$fname1 \"$URL1\" > /dev/null 2>&1"
jar1="java -jar tagsoup-1.2.1.jar --files ${tempSRC}${fname1} > /dev/null 2>&1"

get2="wget -O $tempSRC$fname2 \"$URL2\" > /dev/null 2>&1"
jar2="java -jar tagsoup-1.2.1.jar --files ${tempSRC}${fname2} > /dev/null 2>&1"

while [ $running -eq 1 ]
do
    echo 'Running Script...'
    echo "Updated $updateCounter"
    [ ! -d "$tempSRC" ] && mkdir -p "$tempSRC"
    x=1
    while true
    do
        cmd1=$(eval "$get1")
        sleep 1
        cmd2=$(eval "$jar1")
        sleep 1
        cmd3=$(eval "$get2")
        sleep 1
        cmd4=$(eval "$jar2")
        sleep 1
        echo $(python3 "$pyparse") > /dev/null
        sleep 1
        if [ -L "$tempSRC" ]; then
            rm "$tempSRC"
        else
            rm -r "$tempSRC"
        fi
        sleep 5
        (( updateCounter ++ ))
        break
    done
done