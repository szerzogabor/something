#!/bin/bash
directory="spring-boot-sample-web-ui"
gitUrl="https://github.com/epammephungary/spring-boot-sample-web-ui.git"

if [ -d $directory ]; then
	git pull $gitUrl
#	git pull https://github.com/epammephungary/spring-boot-sample-web-ui.git 
#	echo "it is exists"
else
	git clone $gitUrl
#	git clone https://github.com/epammephungary/spring-boot-sample-web-ui.git   
#	echo "it is not exists"
fi

pid=$(ps | grep java | awk '{print $1}')

if [ -n "$pid" ]; then
	kill $pid
fi

cd $directory
mvn clean install
mvn spring-boot:run &

