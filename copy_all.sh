#!/bin/bash

cd openwrt
for f in $(find . -name .DS_Store)
do 
    rm $f
done

scp -r * wrt:/

