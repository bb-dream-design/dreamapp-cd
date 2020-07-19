#!/usr/bin/bash
ssh -i aws-dream.pem ubuntu@ec2-3-15-210-253.us-east-2.compute.amazonaws.com 'docker-compose --version &&
 cd dreamapp-cd && \
 git pull &&
 pwd &&
 echo "STOP DOCKER COMPOSE" &&
 sudo docker-compose down &&
 echo "START DOCKER COMPOSE" &&
 sudo docker-compose up -d &&
 echo "CHECK DC PS" &&
 sudo docker-compose ps &&
 echo "CHECK DOCKER PS" &&
 sudo docker ps'