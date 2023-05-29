#!/bin/bash

list=$2

name=$1

function confirmlist(){
        
    echo All data and logs will be removed use 
    echo $ mikub list clear date-type list-here
    echo "to only clear the spiffic data type wanted"
    echo "Are you sure you want to delete the list $list y/n ?"
    
    confirmbasic

}

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

case $1 in

   "help" )
        cat ../build-help/help-cutter/delete/delete-help
    ;;

   "list" )

       case $2 in

           $nothing )

               
               confirmbasic
               rm -r -v ../build-logs/*
               rm -r -v ../build-repos/*
               rm -r -v ../build-list/*

           ;;
           
           * )
                           
               confirmbasic
               rm -r -v ../build-custom/$2

           ;;

       esac

   ;;

    "clear" )
        
        case $2 in

            "cache" )

                docker buildx prune -f
                docker system prune -af

            ;;

            "help" ) 

                cat ../build-help/help-cutter/help

            ;;

            "logs" )

                case $3 in

                    "help" )
                        
                        cat ../build-help/help-cutter/help-logs
                    
                    ;;

                    "frame" )

                        case $6 in

                            "date" )

                                confirmbasic
                                rm -r -v ../build-logs/$4/$6

                            ;;

                        esac

                    ;;

                    * ) 

                        case $5 in 

                            $nothing )

                                confirmbasic
                                rm -r -v ../build-custom/$4/build-logs/*                               
                            
                            ;;

                            * )

                                confirmbasic
                                rm -r -v ../build-custom/$4/build-logs/$5

                            ;;

                        esac

                    ;;

                    $nothing ) 

                        confirmbasic
                        rm -r -v ../build-logs/*
                        
                    ;;
                   
                    "list" )

                        case $4 in

                            * )

                                case $5 in
                                
                                    "frame" )

                                        case $7 in

                                            $nothing )

                                                confirmbasic
                                                rm -r -v ../build-custom/$4/$6/

                                            ;;
                                            
                                            "date" )

                                                   confirmbasic
                                                   rm -r -v ../build-custom/$4/build-logs/$6/$8

                                                ;;
                                        
                                        esac

                                    ;;
                                    * ) 

                                        confirmbasic
                                        rm -r -v ../build-custom/$4/build-logs/*

                                    ;;

                                esac

                            ;;

                        esac
                        
                    ;;

                esac

            ;;

            "list" )

                case $3 in

                    "help" )
                        
                        cat ../build-help/help-cutter/help-list
                    
                    ;;

                    * )
                        case $4 in

                            $nothing )

                                confirmbasic
                                rm -r -v ../build-custom/$3/build-list/*

                            ;;

                            * )

                                case $4 in

                                    "frame" )

                                        confirmbasic
                                        rm -r -v ../build-custom/$3/build-list/$5

                                    ;;
                        
                                esac
                                
                            ;;

                        esac
                    ;;

                esac
            ;;

            "repo" )
                
                case $3 in 
                    
                    "help" )

                        cat ../build-help/help-cutter/help-repos
                   
                    ;;

                    "frame" )
                        
                        confirmbasic
                        rm -r -v ../build-repos/$4/*
                    
                    ;;



                    "list" )
                        
                        case $5 in 

                            "frame" )

                                confirmbasic
                                rm -r -v ../build-custom/$4/build-repo/$6
                                
                            ;;

                            $nothing )

                                confirmbasic
                                rm -r -v ../build-custom/$4/build-repo/*

                            ;;

                        esac
                    
                    ;;

                esac
            ;;

        esac

    ;;

    "Miku" )

        #does not work
        echo "Do you really want to delete me?"
        confirmbasic
        rm -r -v $0/../../../*

    ;;

    "all" )

        echo "WARING THIS WILL DELETE ALL THE DATA OF ALL LISTS INCULDING THE DEFAULT"
        confirmbasic
        rm -r -v ../build-custom/*
        rm -r -v ../build-list/*
        rm -r -v ../build-logs/*
        rm -r -v ../build-repos/*
        echo
        echo "All lists removed"
        echo

    ;;

esac