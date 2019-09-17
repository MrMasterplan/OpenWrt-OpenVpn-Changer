#!/bin/sh

echo "Content-type: text/plain"
echo ""
ovpn=$(basename $0)
echo "You selected $ovpn..."

cd /etc/openvpn/

#echo "PWD now:"
#pwd

echo "Removing old link..."
rm nordvpn.ovpn

echo "relink new..."
ln -s nordvpn/$ovpn nordvpn.ovpn

echo "fixing password request..."
sed 's/auth-user-pass$/auth-user-pass secret/' nordvpn.ovpn -i

logread -f -e nordvpn >/root/logs &
logPID=$!

echo "restarting OpenVpn..."
/etc/init.d/openvpn restart

for i in $(seq 1 8)
do
    #echo "file now has $(wc -l /root/logs) lines"
    #grep "Initialization Sequence Completed" /root/logs
    if grep "Initialization Sequence Completed" /root/logs 2>&1 >/dev/null
        then
            break
        fi
    sleep 1
done

kill -2 $logPID

if grep "Initialization Sequence Completed" /root/logs 2>&1 >/dev/null
    then
        echo "=========================="
        echo "Setup of $ovpn completed."
        echo ""
        echo "You can close this page now."
    else
        echo "=========================="
        echo "Something went wrong."
        echo ""
        echo "Feel free to go back and try again."        
    fi
