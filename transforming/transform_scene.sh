#!/bin/bash

check_command()
{
    if ! command -v $1 &> /dev/null
    then
        echo "$1 could not be found"
        exit
    else
        echo "Command: $1 exist."
    fi
}
unziped()
{
    mkdir tmp
    cd tmp
    unzip ../$1 
}


import()
{
    cp ../headtrackr.js js/headtrackr.js
    cp ../pleinecranarrow.png .
    cp ../croix.png .
    contain=$(cat ../import_headtrackr.txt)
    containindex=$(cat index.html)
    echo $contain
    echo "${containindex/<head>/<head>$contain}" > index.html

    containindex=$(cat index.html)
    contain=$(cat ../import_outil.txt)
    echo $contain
    echo "${containindex/<\/body>/$contain<\/body>}" > index.html

    containindex=$(cat js/app.js)
    contain=$(cat ../import_camera.txt)
    echo $contain
    echo "${containindex/this.play = function \(\) \{/this.play = function \(\) \{$contain}" > js/app.js
    
}

if [[ "$1" == *".zip" ]];then
    unziped $1
fi
check_command unzip
import