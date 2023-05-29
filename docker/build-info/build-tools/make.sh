#!/bin/bash

# Compiles the list

list=$1


function custom(){

    rm -r -v ../build-custom/$list/$list-builder.sh
    cat ../build-custom/$list/.config/.opening  >> ../build-custom/$list/$list-builder.sh
    cat ../build-custom/$list/.config/varibles >> ../build-custom/$list/$list-builder.sh
    cat ../build-custom/$list/.config/.middle >> ../build-custom/$list/$list-builder.sh
    cat ../build-custom/$list/build-list/* >> ../build-custom/$list/$list-builder.sh    
    echo >> ../build-custom/$list/$list-builder.sh
    cat ../build-custom/$list/.config/.ending >> ../build-custom/$list/$list-builder.sh
    chmod u+x ../build-custom/$list/$list-builder.sh
    
}

#working

case $1 in

    "help" )

        cat ../build-help/help-make
    
    ;;

    *  )
    
        custom
    
    ;;

esac
