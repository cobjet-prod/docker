# VPN DOCKER IMAGE
--------

1. docker run --privileged -d --name softether -v `pwd`/vpnserver:/usr/local/vpnserver -p 1194:1194/udp -p 1194:1194 -p 443:443 -p 5555:5555 -p 992:992 cobjet/vpn
2. docker run --privileged -t -i --rm --link softether:softether cobjet/vpn vpnadmin
3. docker run --privileged -t -i --rm --link softether:softether cobjet/vpn bash
