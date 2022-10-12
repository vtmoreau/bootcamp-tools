#!/bin/bash

if [ ! -d ~/.wagon-tools ];  then
    mkdir ~/.wagon-tools
fi

curl -s https://raw.githubusercontent.com/vtmoreau/bootcamp-tools/master/check_challenge.sh > ~/.wagon-tools/check_challenge.sh
chmod u+x ~/.wagon-tools/check_challenge.sh

echo 'alias check="zsh ~/.wagon-tools/check_challenge.sh"' >> ~/.aliases
