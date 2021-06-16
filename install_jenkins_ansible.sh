#! /bin/bash

## Change Hostname 

    sudo hostname jenkins_server


##Installing Ansible

    sudo apt update
    sudo apt install ansible -y
    echo [servers] >> /etc/ansible/hosts
    echo server1 ansible_host=127.0.0.1 >> /etc/ansible/hosts

##Installing Jenkins

    sudo apt update
    sudo apt search openjdk
    apt install -y openjdk-11-jre-headless
    java -version
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update
    sudo apt-get install -y jenkins

## Install MAVEN

    cd /opt
    wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
    tar -xvzf apache-maven-3.8.1-bin.tar.gz
    mv apache-maven-3.8.1 maven
    cd maven

    echo "M2=/opt/maven/bin" >> ~/.profile
    echo "PATH=$PATH:$HOME/bin:$M2:$M2_HOME" >> ~/.profile
    echo "export PATH" >> ~/.profile
    sudo apt install maven
    mvn --version 

## Restart Machine
    sudo init 6