# our base image
FROM ubuntu:16.04

# Install python, pip, git
RUN apt-get update
RUN apt-get install  -y software-properties-common
RUN apt-add-repository universe
RUN apt-get update
RUN apt-get install  -y python-pip
RUN apt-get install  -y git

# Install Oktopus modules
# The order is important
WORKDIR /usr/src/app
RUN git clone https://github.com/charlee593/oktopus_framework.git
RUN git clone https://github.com/charlee593/oktopus_eval-scripts.git
RUN git clone https://github.com/charlee593/oktopus_dataset-gen.git

RUN pip install --upgrade pip
RUN pip install -r /usr/src/app/oktopus_framework/requirements.txt
RUN pip install -e /usr/src/app/oktopus_framework
RUN pip install -e /usr/src/app/oktopus_dataset-gen
RUN pip install -e /usr/src/app/oktopus_eval-scripts

WORKDIR /home
