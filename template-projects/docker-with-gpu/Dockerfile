FROM nvidia/cuda:10.0-cudnn7-devel

RUN apt-get update --fix-missing
RUN apt-get install -y nano
RUN apt install python3 python3-pip python3-dev -y

RUN pip3 install --upgrade pip

WORKDIR /app

COPY ./requirements.txt ./
RUN pip3 install -r requirements.txt

CMD [ "/bin/bash" ]
