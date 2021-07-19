#!bin/bash
# Java Installation Egg
# Server Files: /mnt/server 

apt update
apt install unzip zip
apt install -y curl wget git openssl bash bc apt-transport-https gnupg software-properties-common



## Only download if a path is provided, otherwise continue.
if [ ! -z "${DL_PATH}" ]; then
    cd /mnt/server

    MODIFIED_DOWNLOAD=`eval echo $(echo ${DL_PATH} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
    curl -sSL -o ${SERVER_JARFILE} ${MODIFIED_DOWNLOAD}
else
    mkdir -p /srv/
    cd /srv/

    wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

    java -jar BuildTools.jar --rev ${DL_VERSION}

    mv spigot-*.jar /mnt/server/${SERVER_JARFILE}
fi