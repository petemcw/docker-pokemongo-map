#!/bin/bash

if [ ! -d "/app/.git" ]; then
    echo "==> An empty or uninitialized repository was detected"
    echo "-----> Initializing repository..."
    git init .
    echo "-----> Done!"

    echo "==> pulling remote content from $BRANCH"
    git remote add origin https://github.com/AHAAAAAAA/PokemonGo-Map.git
    git pull origin $BRANCH
    echo "-----> Done!"

    echo "==> Installing application"
    pip install -r requirements.txt
    npm install
    npm install -g grunt-cli
    npm install node-sass
    grunt build
    chown -R ash:ash /app
    echo "-----> Done!"
else
    echo "==> Using existing repository, pulling changes"
    git reset --hard origin/$BRANCH
    git pull origin $BRANCH
    echo "-----> Done!"

    echo "==> Installing application"
    pip install --upgrade -r requirements.txt
    npm update
    grunt build
    chown -R ash:ash /app
    echo "-----> Done!"
fi
