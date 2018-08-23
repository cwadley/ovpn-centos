#!/bin/bash
# setup-machine.sh
source settings.sh

yum install -y git
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
systemctl enable docker
systemctl start docker

git clone https://github.com/kylemanna/docker-openvpn.git
cd docker-openvpn
docker build -t openvpn .
cd ..

mkdir /etc/openvpn
if [ $port -eq 1194 ]; then
	docker run -v /etc/openvpn:/etc/openvpn --rm openvpn ovpn_genconfig -u ${protocol}://${address}
else
	docker run -v /etc/openvpn:/etc/openvpn --rm openvpn ovpn_genconfig -u ${protocol}://${address}:${port}
fi

docker run --rm -it -v /etc/openvpn:/etc/openvpn openvpn ovpn_initpki