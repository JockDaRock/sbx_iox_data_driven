#! /bin/bash

# Basic Setup Process for IOx Data Driven VM

# Run IOx Client install
echo "Running Setup ioxlcient"
mkdir /ioxclient
cd /ioxclient
curl -O https://pubhub-prod.s3-us-west-2.amazonaws.com/media/iox-docs/docs/artifacts/ioxclient/ioxclient-v1.4.0.0/ioxclient_1.4.0.0_linux_amd64.tar.gz
tar -zyxf ioxclient_1.4.0.0_linux_amd64.tar.gz
cd ioxclient_1.4.0.0_linux_amd64
chmod +x ioxclient
cp ioxclient /usr/local/bin/ioxclient

# Run install of IOx Data Services
echo "Running setup of Data Services"
cd /
mkdir /data_services
cd /data_services
curl -O https://raw.githubusercontent.com/CiscoDevNet/MQTT-Data-Form/master/docker-compose.yml
docker stack deploy mqtt -c docker-compose.yml
rm docker-compose.yml
curl -O https://raw.githubusercontent.com/CiscoDevNet/docker_registry_service/master/docker-compose.yml
docker stack deploy reg -c docker-compose.yml
rm docker-compose.yml
curl -O https://raw.githubusercontent.com/JockDaRock/Time2Code/master/time2code-swarm-deploy.yml
docker stack deploy time2code -c time2code-swarm-deploy.yml
rm time2code-swarm-deploy.yml


# Done
echo "Done!"
