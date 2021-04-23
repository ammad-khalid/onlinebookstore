FROM tomcat:8.0-alpine

ADD sample.war /usr/local/tomcat/webapps/
RUN cd /usr/local/tomcat/webapps/ && curl -u login:passwd -o junit-1.2.jar "nexus repository URL/junit-1.2.jar" -L

EXPOSE 8080

CMD [“catalina.sh”, “run”]
