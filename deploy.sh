#!/usr/bin/bash
ssh -i aws-dream.pem ubuntu@ec2-3-15-210-253.us-east-2.compute.amazonaws.com 'docker-compose --version &&
  cd dreamapp-cd && \
  echo "UPDATE FILES FROM REPO" &&
  git pull &&
  sudo docker pull dream20200716/dream-design-app:latest &&
  pwd &&
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
