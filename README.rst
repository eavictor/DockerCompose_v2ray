==========================
Docker Compose v2ray setup
==========================

-------------
General Setup
-------------

    1. Pull this repo

    .. code-block:: shell

        cd /home
        git clone https://github.com/eavictor/DockerCompose_v2ray.git

    2. Install docker and add user to docker group

    .. code-block:: shell

        cd ./DockerCompose_v2ray
        chmod +x ./install_docker.sh
        ./install_docker.sh <username(optional)>

------------
Server Setup
------------

    1. Modify UUID (+ add additional users)

    .. code-block:: shell

        cd ./server
        sudo nano config.json

    2. Start Service

    .. code-block:: shell

        docker-compose -f docker-compose.yml up -d

------------
Client Setup
------------

    1. Modify UUID & Server IP/Domain & Userame & Password (+ add additional servers)

    .. code-block:: shell

        cd ./client
        sudo nano config.json

    2. Start Service

    .. code-block:: shell

        docker-compose -f docker-compose.yml up -d