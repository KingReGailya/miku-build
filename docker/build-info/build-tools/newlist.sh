#!/bin/bash

#makes a new list

list=$2
type=$1

function yesnt(){

    echo Are you sure you want to proceed y / n ?
    read answer

   case $answer in 

        "y" )

            mkdir ../build-custom/$list
            mkdir ../build-custom/$list/build-list
            mkdir ../build-custom/$list/temp
            echo $type >> ../build-custom/$list/.type
            cp -r -v ../.opening ../build-custom/$list/build-list/.opening

        ;;

        "n" )

            exit

        ;;

        * )

            yesnt
        
        ;;
    
    esac

}

function confirm (){
 
  echo "the list list $list can cause confilcts with commands"
  yesnt 

}

case $list in

    $nothing )

        echo "can not make an unammed list"

    ;;

    "help" )

        confirm
    
    ;;

    * )
 
        list=$list
        mkdir ../build-custom/$list
        mkdir ../build-custom/$list/build-list
        mkdir ../build-custom/$list/build-logs
        mkdir ../build-custom/$list/temp
        cp -rv ../build-custom/.config-templates/$type ../build-custom/$list/.config
        echo >> ../build-custom/$list/.config/varibles
        echo list=$list >> ../build-custom/$list/.config/varibles
        mkdir ../build-custom/.config-templates/$type/frames
        echo $type >> ../build-custom/$list/.config/type

    ;;

esac

