#!/bin/bash

list=$1 
frame=$3

cat ../build-custom/$list/build-list/.opening >> ../build-custom/$list/build-list/temp.sh
cat ../build-custom/$list/build-list/$frame >> ../build-custom/$list/build-list/temp.sh
chmod u+x ../build-custom/$list/build-list/temp.sh
rm -v ../build-custom/$list/build-list/temp.sh
