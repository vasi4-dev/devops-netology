#!/bin/bash

sudo service docker start

docker run -dit --name centos7 pycontribs/centos:7 /bin/bash
docker run -dit --name ubuntu pycontribs/ubuntu:latest  /bin/bash
docker run -dit --name fedora pycontribs/fedora  /bin/bash


ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

sudo docker stop $(sudo docker ps -a -q)  
 
sudo docker rm $(sudo docker ps -a -q)  
