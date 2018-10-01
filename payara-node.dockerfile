FROM openjdk:8-jdk

ENV PAYARA_PATH /opt/payara5

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN useradd -b /opt -m -s /bin/bash -d ${PAYARA_PATH} payara && echo payara:payara | chpasswd

# RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# EXPOSE 22 5000-6000 20000-30000
EXPOSE 1-65000/udp 1-65000/tcp

CMD    ["/usr/sbin/sshd", "-D"]
