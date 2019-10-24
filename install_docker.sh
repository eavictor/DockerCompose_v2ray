#!/usr/bin/env bash

COMPOSE_VERSION="1.24.1"

# Check user run this script with admin privilege
if [[ $EUID -ne 0 ]]
  then echo "Please run as root"
  exit 1
fi

# uninstall old docker engine
apt remove docker docker-engine docker.io containerd runc -y

# install docker requirements
apt update
apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

# add apt key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# add mirror link and install new docker engine
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install docker-ce docker-ce-cli containerd.io -y

# add user to docker group
if [[ $(echo -n $1 | wc -m) -gt 0 ]]
then
    echo "Add user $1 to group docker"
    usermod -aG docker $1
fi

# install docker-compose
curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

exit 0