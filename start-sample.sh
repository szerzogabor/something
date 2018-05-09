#!/bin/bash
directory="spring-boot-sample-web-ui"
gitUrl="https://github.com/epammephungary/spring-boot-sample-web-ui.git"

if [ -d $directory ]; then
	git pull $gitUrl
else
	git clone $gitUrl
fi

pid=$(ps -A | grep java | awk '{print $1}')
if [ -n "$pid" ]; then
	kill $pid
fi

cd $directory
mvn clean install
mvn spring-boot:run &

