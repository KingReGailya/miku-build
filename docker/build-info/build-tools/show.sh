#!/bin/bash

case $1 in

    "help" )

        cat ../build-help/help-show/help
    
    ;;


    "lists" )

                ls ../build-custom


            ;;

    "list" )

        case $2 in

            $nothing )

                ls ../build-list
            
            ;;
            
            "frame" )

                cat ../build-list/$3

            ;;

            * )

                case $3 in

                    $nothing )
                        
                        ls ../build-custom/$2/build-list  

                    ;;

                    "frame" )

                        cat ../build-custom/$2/build-list/$4
                    
                    ;;

                esac 
               
            ;;

        esac

    ;;

esac          