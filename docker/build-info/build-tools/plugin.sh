#!/bin/bash


function confirmbasic(){
    
    echo "Are you sure you want to Proceed Y / N ?"

    read answer

    case $answer in

        "y" )

        ;;

        "n" )

            exit

        ;;
    
        *  )
    
            confirmbasic
    
        ;;
    
    esac

}

type=$1

link=$2

template=$3

case $4 in 

    $nothing )

        name=$3

    ;;

    * )

        name=$4

    ;;

esac 

git clone $link ../temp

case $type in

    "plugin" )

        required=`ls ../temp/plugin/$template/required`

        case $required in

            "required" )

                echo "This plugin reqires programs that may not be availbe in the offial docker image and may need to be reinstalled upon restart"
                confirmbasic 

            ;;
            
        esac 
        
        cp -rv ../temp/plugin/$template ../build-custom/.custom-tools/$name
        chmod u+x ../build-custom/.custom-tools/$name/main.sh

    ;;

    "template" )

        cp -rv ../temp/template/$template ../build-custom/.config-templates/$name

    ;;

    * )

        echo 
        echo "Unknown object $object"
        echo "This object type may not be supported"
        echo
        exit

    ;;

esac 

rm -rf ../build-custom/temp