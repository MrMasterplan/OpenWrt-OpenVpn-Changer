# OpenWrt-OpenVpn-Changer

This is a setup that adds a we-interface for chanigng the openvpn setup file.
I followed the tutorial from NordVPN: https://support.nordvpn.com/Connectivity/Router/1047411192/OpenWRT-CI-setup-with-NordVPN.htm

Except I put the config file in `/etc/openvpn/nordvpn/` and synlinked it from `/etc/openvpn/nordvpn.ovpn`.

This selection of scripts, when used, allows you to drop all the nordvpn setup files you want into the folder `/etc/openvpn/nordvpn/`.
They will all show up in the the web-configurator and you can then click them to set them up for use.
