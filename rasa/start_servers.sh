#!/bin/bash
set -e 

function isCmdExist()
{
    local cmd="$1"
    if [ -z "$cmd" ]; then
        echo "Usage isCmdExist yourCmd"
        return 1
    fi

    which "$cmd" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        return 0
    fi

    return 2
}

function createVirtualEnv()
{
    isCmdExist virtualenv
    if [ $? -ne 0 ]; then
        echo "virtualenv not exist, pip install now ..."
        pip install virtualenv==20.10.0
    fi

    if [ -f "$(pwd)/rasa_ep/runenv/bin/activate" ]; then
        echo "virtualenv already existed"
        source "$(pwd)/rasa_ep/runenv/bin/activate"
    else
        echo "virtualenv not exist, create now ..."
        virtualenv "$(pwd)/rasa_ep/runenv"
        source "$(pwd)/rasa_ep/runenv/bin/activate"
        pip install -r rasa_ep/requirements.txt
        python3 -m spacy download zh_core_web_sm
    fi
    
    return 0
}

echo "start running ..."
createVirtualEnv
cd rasa_ep
echo "deleting models and cache ..."
sudo rm -rf .rasa/
sudo rm -rf models/
echo "start rasa train ..."
rasa train
cd ..
echo "deactivate runenv ..."
deactivate
echo "run docker-compose up ..."
docker-compose up -d