#!/bin/bash
docker stop [container-name]

if [ "$1" = "build" ]; then
    docker build -t [image-name] .
fi

docker run -p 9360:80 \
    --rm \
    -v $(pwd):/app \
    --gpus all \
    --name [container-name] \
    [image-name]

echo To enter the container run:
echo docker exec -it [container-name] bash
