#Use the image to create the tomee
FROM centos:latest

#MAINTAINER INFORMATION
MAINTAINER Praveen Ranganathan praveen.maddy@gmail.com

##CHANGE TO DIR
WORKDIR /var/tmp

COPY Build_TOMEE.sh /var/tmp


RUN /bin/sh -c '/var/tmp/Build_TOMEE.sh'

ADD webapps.tar.gz /opt/apps/middleware/apache/tomee/


#COPYING the configuration files to respective tomee config directories
COPY logging.properties training.keystore server.xml tomcat-users.xml /opt/apps/middleware/apache/tomee/conf/
COPY setenv.sh catalina.sh /opt/apps/middleware/apache/tomee/bin/

#EXPOSE THE PORTS TO THE OUTSIDE WORLD
EXPOSE 8009 8080 8443

#ENTRYPOINT TO START THE TOMEE SERVICE
#ENTRYPOINT ["/opt/apps/middleware/apache/tomee/bin/catalina.sh", "run"]
#ENTRYPOINT ["/opt/apps/middleware/apache/tomee/bin/catalina.sh", "-D", "FOREGROUND"]
CMD ["/opt/apps/middleware/apache/tomee/bin/catalina.sh", "run" ]
