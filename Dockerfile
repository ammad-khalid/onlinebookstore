FROM tomcat:8.0-alpine

#ADD sample.war /usr/local/tomcat/webapps/
ARG BUILD_ID
#RUN cd /usr/local/tomcat/webapps/ && curl -u login:passwd -o junit-1.2.jar "nexus repository URL/junit-1.2.jar" -L
RUN cd /usr/local/tomcat/webapps/ && wget --user=admin:${adminpassword} "http://20.74.182.250:8081/repository/cp4i-project/onlinebookstore-${BUILD_ID}/$/onlinebookstore-${BUILD_ID}-$.war"

EXPOSE 8080

CMD [“catalina.sh”, “run”]
