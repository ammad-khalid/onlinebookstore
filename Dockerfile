FROM tomcat:8.0-alpine
ARG BUILD_ID
ENV BUILD_ID=${BUILD_ID}
RUN echo ${BUILD_ID}
#worked#
COPY ./onlinebookstore-${BUILD_ID}.war /usr/local/tomcat/webapps/

#RUN cd /usr/local/tomcat/webapps/ && curl -u admin:admin -o onlinebookstore-${BUILD_ID}-v1.war "http://20.74.182.192:8081/repository/cp4i-project/onlinebookstore-${BUILD_ID}/v1/onlinebookstore-${BUILD_ID}-v1.war" -L
#RUN cd /usr/local/tomcat/webapps/ && wget http://20.74.182.192:8081/repository/cp4i-project/onlinebookstore-${BUILD_ID}/v1/onlinebookstore-${BUILD_ID}-v1.war

EXPOSE 8080

#CMD [“catalina.sh”, “run”]
