#!/usr/bin/bash
ssh -i aws-dream.pem ubuntu@ec2-3-15-210-253.us-east-2.compute.amazonaws.com 'docker-compose --version &&
  cd dreamapp-cd && \
  echo "UPDATE FILES FROM REPO" &&
  git pull &&
  sudo docker pull dream20200716/dream-design-app:latest &&
  sudo docker pull dream20200716/dream-ui:latest &&
  pwd &&
  export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk "{ print  }" | cut -f2 -d: | head -n1) &&
  echo "STOP DOCKER COMPOSE" &&
  sudo docker-compose down &&
  echo "START DOCKER COMPOSE" &&
  sudo docker-compose up -d &&
  echo "" &&
  echo "CHECK COMPOSE PS" &&
  sudo docker-compose ps &&
  echo "" &&
  echo "CHECK DOCKER PS" &&
  sudo docker ps
  '
