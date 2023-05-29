#!/bin/bash

loc=$1

case $2 in

    "export" )
       
        case $3 in 

            $nothing )

                name=mikub-export

            ;;

            * )

                name=$3

            ;;

        esac 

        mkdir ../export ../export/build-list
        cp -r -v ../build-custom ../export
        cp -r -v ../build-list/* ../export/build-default/build-list/*
        cp -r -v ../build-logs ../export/build-default
        cd ..
        tar -czf $name.tar export
        rm -rvf export
        
    ;;

    "import" )
    
      tar xzf $3 -C $1/..
      cp -r -v $1/../export/build-custom/* ../build-custom
      cp -r -v $1/../export/build-default/build-list ../build-list
      cp -r -v $1/../export/build-default/build-logs ../build-logs
      rm -rvf ../export

    ;;
    
esac