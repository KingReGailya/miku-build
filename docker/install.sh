#!/bin/bash 

echo "Warning this program comes with no warrenty to any extent y / n ?"

loc=`echo $PWD`

function install(){

        rm -r -v /bin/mikub
        bash -c 'echo "#!/bin/bash" >> /bin/mikub'
        bash -c 'echo loc='$loc' >> /bin/mikub'
        bash -c 'echo cd '$loc/build-info/build-tools' >> /bin/mikub'
        bash -c ' echo >> /bin/mikub'
        bash -c ' echo "$PWD/build-info/build-tools/mikub" '$loc'/build-info/build-tools "$""*" >> /bin/mikub'
        chmod u+x /bin/mikub
        chmod 777 /bin/mikub 
        chmod u+x build-info/build-tools/*
        echo "Os" >> $PWD/build-info/installed-version
}


function yesnt(){
        
        read answer     
               
        case $answer in
                "y" )
                    
                    install ;;
             
                "n" )
                    
                    exit ;;

                *  )
                    
                    echo "y/n" 
                    yesnt ;;

        esac

}

yesnt