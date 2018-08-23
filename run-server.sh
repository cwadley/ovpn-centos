#!/bin/bash
# run-server.sh
source settings.sh

docker run -d --restart unless-stopped --name openvpn -v /etc/openvpn:/etc/openvpn -p ${port}:1194/${protocol} --cap-add=NET_ADMIN openvpn 