FROM ubuntu:latest

RUN apt-get update && apt-get install -y firefox

RUN useradd -ms /bin/bash developer && \
 echo "\ndeveloper ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER developer
ENV HOME /home/developer
CMD /usr/bin/firefox