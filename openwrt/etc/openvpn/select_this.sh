#!/bin/sh

echo "Content-type: text/plain"
echo ""
ovpn=$(basename $0)
echo "You selected $ovpn"

cd /etc/openvpn/

echo "PWD now:"
pwd

echo "Remove old link..."
rm nordvpn.ovpn

echo "relink new..."
ln -s nordvpn/$ovpn nordvpn.ovpn

echo "fixing password request..."
sed 's/auth-user-pass$/auth-user-pass secret/' nordvpn.ovpn -i

echo "restart OpenVpn"
/etc/init.d/openvpn restart
