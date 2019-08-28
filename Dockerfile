FROM ubuntu:16.04
MAINTAINER (original) Fabian Stäber, fabian@fstab.de

#####################################################################################
# Current version is aws-cli/1.10.53 Python/2.7.12
#####################################################################################

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y tzdata locales

# Set the timezone
RUN echo "US/Mountain" | tee /etc/timezone && \
    ln -fs /usr/share/zoneinfo/US/Mountain /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Set the locale for UTF-8 support
RUN echo en_US.UTF-8 UTF-8 >> /etc/locale.gen && \
    locale-gen && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8


ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# AWS CLI needs the PYTHONIOENCODING environment varialbe to handle UTF-8 correctly:
ENV PYTHONIOENCODING=UTF-8

# man and less are needed to view 'aws <command> help'
# ssh allows us to log in to new instances
# vim is useful to write shell scripts
# python* is needed to install aws cli using pip install

RUN apt-get install -y \
    less \
    man \
    ssh \
    python \
    python-pip \
    python-virtualenv \
    ansible \
    wget \
    vim \
    vim-nox \
    zip


RUN wget https://releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip \
&& unzip packer_1.4.3_linux_amd64.zip && rm packer_1.4.3_linux_amd64.zip && mv packer /usr/local/bin

RUN wget https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip \
&& unzip terraform_0.12.6_linux_amd64.zip && rm terraform_0.12.6_linux_amd64.zip && mv terraform /usr/local/bin

RUN adduser --disabled-login --gecos '' aws
WORKDIR /home/aws

USER aws

RUN \
    mkdir aws && \
    virtualenv aws/env && \
    ./aws/env/bin/pip install awscli && \
    ./aws/env/bin/pip install requests && \
    echo 'source $HOME/aws/env/bin/activate' >> .bashrc && \
    echo 'complete -C aws_completer aws' >> .bashrc  && \
    echo 'alias deploy="cd /home/aws/liatrio; ./deployInfra.sh"' >> .bashrc && \
    echo 'alias teardown="cd /home/aws/liatrio; ./teardown.sh"' >> .bashrc

USER root

RUN mkdir /home/aws/liatrio
ADD liatrio-infra-automation /home/aws/liatrio

RUN chown -R aws:aws /home/aws

USER aws

SHELL ["/bin/bash", "-c", "source /home/aws/liatrio/deployInfra.sh"]
