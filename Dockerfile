FROM python:3.11-slim

RUN apt update
RUN apt install git curl python3-pip ffmpeg -y

COPY requirements.txt /requirements.txt

RUN cd /
RUN pip3 install -U -r requirements.txt

RUN mkdir /MusicPlayer
WORKDIR /MusicPlayer

COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

CMD ["/bin/bash", "/startup.sh"]
