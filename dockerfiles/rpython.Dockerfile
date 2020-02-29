# docker build -f rpython.Dockerfile -t registry.gitlab.com/r.stegeman/rkb/rpython .
# docker push registry.gitlab.com/r.stegeman/rkb/rpython
# docker run -it --rm --name rpython-container registry.gitlab.com/r.stegeman/rkb/rpython

FROM python:3.6-buster

RUN apt-get update && \
    apt-get install nano

CMD ["/bin/bash"]
