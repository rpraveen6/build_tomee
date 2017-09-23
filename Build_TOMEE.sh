#!/usr/bin/bash
####
####
####
######################################################################################################
#### AUTHOR 		: PRAVEEN RANGANATHAN
#### Version 		: 1.0
#### Created		: 18-SEP-2017
#### EMAIL		: praveen.maddy@gmail.com
######################################################################################################
####
#### PURPOSE		: To install OpenJdk and Tomme on Centos Docker Image
#### Description	: The script is used to install customized OpenJdk & TOMEE Versions.
####
####
######################################################################################################

OS_DEPENDENCIES()
{
	##Installs supporting tools and OpenJDK JRE...
	##yum install -y less openssl* which java-1.8*-openjdk
	yum install -y less which java-1.8*-openjdk
}

DOWNLOAD_TOMEE()
{
	## We are downloading TOMEE web profile (7.0.0) for testing. 
	## Other TOMEE versions can be downloaded as per the requirement.

	mkdir -p /opt/apps/middleware/apache && \
	cd /opt/apps/middleware/apache && \
	tar -zxo -C /opt/apps/middleware/apache < <(curl -q http://repo.maven.apache.org/maven2/org/apache/tomee/apache-tomee/7.0.0/apache-tomee-7.0.0-webprofile.tar.gz) && \
	mv /opt/apps/middleware/apache/apache-tomee-webprofile-7.0.0 /opt/apps/middleware/apache/tomee && \
	chmod -R 755 /opt/apps/middleware/apache/tomee
	
	##Removes the default webapps. A new webapp gets copied using Dockerfile
	rm -rf /opt/apps/middleware/apache/tomee/webapps
}


### Function installs OS packages required for HTTPD Compilation
OS_DEPENDENCIES

### Function downloads HTTPD and APR packages
DOWNLOAD_TOMEE
