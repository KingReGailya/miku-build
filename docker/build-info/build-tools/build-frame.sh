#!/bin/bash

# WARING MODIFFING THE FILE MAY END UP BRAKING THE PROGRAM 
# Proceed with caution

#git repo
#               list FrameName      Type branch ImageName                  RepoLink
#mikub add list mikua mikua-nightly repo master kingregailya/mikua:nightly https://github.com/KingReGailya/mikua.git
#       0         1        2          3    4                5                         

#Dir
#               list FrameName     Type path ImageName
#mikub add list mikua mikua-nightly dir path kingregailya/mikua:nightly
#                 1        2         3    4              5

list=$1
name=$2
type=$3
dir=$4 
branch=$4
imageName=$5
repoLink=$6

case $2 in
        $nothing)
            echo "What do you want the frame name to be?"
            read name
            echo "What type is the frame repo/dir?"
            read type
            case $type in 
                "dir" )
                    echo "What is the path from /"
                    read dir
                    echo "What is the image name?"
                    read imageName
                ;;
                "repo" )
                    echo "What is the repo link?"
                    read repoLink
                    echo "What Branch are you using?"
                    read branch
                    echo "What is the image name?"
                    read imageName
                ;;
                * )
                    echo "Invailed Type"
                    exit
                ;;
            esac
        ;;
esac
case $branch in
    $nothing)
        branch=""
    ;;
    *)        
        branch=" --branch $4"
    ;;
esac
case $type in 

    "dir" )
        echo >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo "####" >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo "#Builds the $name / $image image from Directory $repo " >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo "mkdir ../build-custom/$list/build-logs/$name" >> ../build-custom/$list/build-list/$name
        echo "mkdir ../build-custom/$list/build-logs/$name/"'$date' >> ../build-custom/$list/build-list/$name
        echo "rm -r -v ../build-custom/$list/build-repos/$name" '>>' "../build-custom/$list/build-logs/$name/"'$date'"/1-rm.log" >> ../build-custom/$list/build-list/$name
        echo "cp -r -v $dir ../build-custom/$list/build-repos/$name" '>>' "../build-custom/$list/build-logs/$name/"'$date'"/2-copy.log" >> ../build-custom/$list/build-list/$name
        echo "docker" ' $builder ' "-t $image ../build-custom/$list/build-repos/$name/" '>>' "../build-custom/$list/build-logs/$name/"'$date'"/3-build.log" >> ../build-custom/$list/build-list/$name
        echo '$ignore' "docker push $image" '>>' "../build-custom/$list/build-logs/$name/"'$date'"/4-push.log" >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name    
        echo "####" >> ../build-custom/$list/build-list/$name
    ;;
    "repo" )
        echo >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo "####" >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo "#Builds the $name / $image image from Directory $repo " >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo "mkdir ../build-custom/$list/build-logs/$name" >> ../build-custom/$list/build-list/$name
        echo "mkdir ../build-custom/$list/build-logs/$name/"'$date' >> ../build-custom/$list/build-list/$name
        echo "rm -r -v ../build-custom/$list/build-repos/$name" '>>' "../build-custom/$list/build-logs/$name/"'$date'"/1-rm.log" >> ../build-custom/$list/build-list/$name
        echo "git clone $repoLink $branch ../build-custom/$list/build-repos/$name" '>>' "../build-custom/$list/build-logs/$name/"'$date'"/2-copy.log" >> ../build-custom/$list/build-list/$name
        echo "docker" ' $builder ' "-t $imageName ../build-custom/$list/build-repos/$name/" '>>' "../build-custom/$list/build-logs/$name/"'$date'"/3-build.log" >> ../build-custom/$list/build-list/$name
        echo "docker push $image" '>>' "../build-custom/$list/build-logs/$name/"'$date'"/4-push.log" >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo >> ../build-custom/$list/build-list/$name
        echo "####" >> ../build-custom/$list/build-list/$name
    ;;
esac