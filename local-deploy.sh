#!/usr/bin/bash
echo "=========| START DEPLOY |==========" && \
echo "" && \
echo "=========| CHECK VERSION |==========" && \
docker-compose --version && \
echo "" && \
echo "=========| CHECK WHERE AM I |==========" && \
pwd && \
echo "" && \
echo "=========| PULLING LATEST VERSION |==========" && \
echo "=========| UPD BACK-END |==========" && \
sudo docker pull dream20200716/dream-design-app:latest && \
echo "=========| UPD UI |==========" && \
sudo docker pull dream20200716/dream-ui:latest && \
echo "" && \
echo "=========| GET LOCAL HOST IP FOR PROXY_PASS REQUESTS |==========" && \
#export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk "{ print  }" | cut -f2 -d: | head -n1) &&
#echo "DOCKERHOST= $DOCKERHOST" && \
export HOSTIP=$(hostname -I | cut -d ' ' -f1) && \
echo "HOSTIP = $HOSTIP" && \
echo "" && \
echo "=========| WRITE LOCAL HOST IP INTO .ENV |==========" && \
echo "HOSTIP=$HOSTIP" > .env && \
cat .env &&\
echo "" && \
echo "=========| STOP DOCKER COMPOSE |==========" && \
sudo docker-compose down && \
echo "" && \
echo "=========| START DOCKER COMPOSE |==========" && \
sudo docker-compose up -d && \
echo "" && \
echo "=========| CHECK COMPOSE PS |==========" && \
sudo docker-compose ps && \
echo "" && \
echo "=========| CHECK DOCKER PS |==========" && \
sudo docker ps
