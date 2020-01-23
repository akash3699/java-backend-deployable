# download the required node base image
FROM tomcat

# copy all the files including node_modules directory
COPY DacAug2019.war /usr/local/webapps


MAINTAINER  Akash Wadhawane <akash3699@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list

RUN apt-get -y update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y 

ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt clean

RUN update-java-alternatives -s java-8-oracle

RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*





# EXPOSE PORT 8080
EXPOSE 8080

# RUN: executes the command(s) while starting the container
# start the apache
CMD tomcat -D FOREGROUND
