
############################################################
# Dockerfile to run a Java based Application
# Based on an Ubuntu Image
############################################################

 #Set the base image to use to Ubuntu
FROM ubuntu:14.04


# Set the file maintainer (your name - the file's author)
MAINTAINER NB

# Set env variables used in this Dockerfile (add a unique prefix, such as DOCKYARD)
# Local directory with project source
#TO DO
 
# Install Pre-requisites
RUN apt-get update
RUN apt-get install software-properties-common -y

#Install  java8
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install oracle-java8-installer -y
RUN apt-get install oracle-java8-set-default

# Install tools
run apt-get install -y git 

#Clone the project
WORKDIR /
run git init
run git clone https://github.com/iownclouds/scaling_clouds.git
run git checkout scaling_clouds

#run git pull origin master
#Pull the code if there are any latest updates


# Copy entrypoint script into the image
RUN cd scaling_clouds
ADD docker-entrypoint.sh /scaling_clouds/helloworldjava/docker-entrypoint.sh

# Set script to be executable
RUN chmod -R a+rwx /scaling_clouds
#ENTRYPOINT //docker-entrypoint.sh
CMD ["/bin/sh","/scaling_clouds/helloworldjava/docker-entrypoint.sh"]