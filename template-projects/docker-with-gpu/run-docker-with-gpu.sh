#!/bin/bash
projectname="example-name"

docker stop $projectname-container

if [ "$1" = "build" ]; then
    docker build -t $projectname-image .
fi

docker run -p 9360:80 \
    --rm \
    -it \
    -d \
    -v $(pwd):/app \
    --gpus all \
    --name $projectname-container \
    $projectname-image 

echo To enter the container run:
echo docker exec -it $projectname-container
