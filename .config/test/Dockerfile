FROM ubuntu:22.04

RUN apt update -qqqq
RUN apt install -y git sudo
RUN adduser --disabled-password --shell /bin/bash --gecos "User" testuser


RUN chown -R testuser:testuser /home/testuser

RUN echo  "testuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER testuser

CMD [ "bash" ]
