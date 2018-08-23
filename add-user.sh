#!/bin/bash
# add-user.sh

if [ -z "$1" ]; then
	echo "Usage: add-user.sh <username>"
	exit 1
fi

docker run --rm -it -v /etc/openvpn:/etc/openvpn openvpn easyrsa build-client-full ${1} nopass
docker run --rm -v /etc/openvpn:/etc/openvpn openvpn ovpn_getclient ${1} > ${1}.ovpn