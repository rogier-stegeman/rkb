# docker build -f rsudo.Dockerfile -t registry.gitlab.com/r.stegeman/rkb/rsudo .
# docker push registry.gitlab.com/r.stegeman/rkb/rsudo
# docker run -it -w '/mounted' --rm --name rsudo-container --volume $(pwd):/mounted registry.gitlab.com/r.stegeman/rkb/rsudo

# Creates a container with python and mounts the current directory as a volume.
# Allows for editing files which require sudo rights if you don't have them.
# Assign to a function in .bashrc for practicality:
# rsudo() {
#    docker run -it -w '/mounted' --rm --name rsudo-container --volume $(pwd):/mounted registry.gitlab.com/r.stegeman/rkb/rsudo
# }

FROM python:3.6-buster

RUN apt-get update && \
    apt-get install nano

RUN touch test.txt

CMD ["/bin/bash"]
