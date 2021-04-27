FROM tomcat:8.0-alpine
ARG BUILD_ID
#worked#
COPY ./onlinebookstore-${BUILD_ID}.war /usr/local/tomcat/webapps/

#RUN cd /usr/local/tomcat/webapps/ && curl -u login:passwd -o junit-1.2.jar "nexus repository URL/junit-1.2.jar" -L
#RUN cd /usr/local/tomcat/webapps/ && wget "http://20.74.182.250:8081/repository/cp4i-project/onlinebookstore-${BUILD_ID}/v1/onlinebookstore-${BUILD_ID}-$.war"

EXPOSE 8080

#CMD [“catalina.sh”, “run”]
