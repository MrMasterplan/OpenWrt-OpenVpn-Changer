#!/bin/bash

ssh wrt "rm /etc/openvpn/nordvpn/*.ovpn"

cd openwrt
for f in $(find . -name .DS_Store)
do 
    rm $f
done

scp -r * wrt:/

