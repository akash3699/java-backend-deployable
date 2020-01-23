#!/bin/bash

# install the anuglar dependency
#npm install

# build the application
#ng build --prod

# remove the container if exists or running
if [ $(docker container ls -q --filter name=my_app_backend_container) != '' ]; then
    docker container stop my_app_backend_container
    docker container rm my_app_backend_container
fi

# remove the image if exists
if [ $(docker image ls -q --filter reference=my_app_backend) != '' ]; then
    docker image rm my_app_backend
fi

# build the image
docker build -t my_app_frontend .

# start the container
docker run -itd -p 8080:8080 --name my_app_backend_container my_app_backend
