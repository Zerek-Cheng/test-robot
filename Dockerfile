FROM jenkins/inbound-agent:jdk8
USER root
COPY ./requirements.txt ./requirements.txt

RUN apt update && \
        apt -y install python3-distutils && \
        ln -s /usr/bin/python3.9 /usr/bin/python && \
        apt -y install wget && \
        wget https://bootstrap.pypa.io/get-pip.py && \
        python get-pip.py && \
        pip install -r ./requirements.txt && \
        rm -f requirements.txt

USER jenkins