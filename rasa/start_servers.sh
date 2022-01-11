#!/bin/bash
source /home/ubuntu/menghui/virtualenvs/rasa3/bin/activate
cd /home/ubuntu/bot/rasa/rasa_ep
rasa train
cd ..
docker-compose up -d