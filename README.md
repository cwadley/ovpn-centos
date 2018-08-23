# ovpn-centos
Scripts to set up and run OVPN in a docker container
These scripts assume a fresh install of CentOS 7

## How to use
1. Edit settings.sh to set protocol, server address, and port
2. Run setup-machine.sh as sudo. This script has interactive portions which will ask you to create a password for the certificate CA
3. Run start-server.sh as sudo

## Add a user
1. Run add-user.sh as sudo with a username as a parameter. This script has an interactive portion which will ask you to ender the password for the certificate CA you created during the setup-machine.sh script
2. The configuraton file for that user will be saved to the current directory as ${username}.ovpn

## Stop the server
1. Run stop-server.sh as sudo