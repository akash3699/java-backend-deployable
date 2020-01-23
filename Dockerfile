# download the required node base image
FROM tomcat

# copy all the files including node_modules directory
COPY DacAug2019.war /usr/local/webapps

# EXPOSE PORT 8080
EXPOSE 8080

# RUN: executes the command(s) while starting the container
# start the apache
CMD tomcat -D FOREGROUND
