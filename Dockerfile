FROM tomcat:8.0-alpine
ARG BUILD_ID
#ENV BUILD_ID=${BUILD_ID}
ARG username
ARG password
RUN echo ${BUILD_ID}

#worked#
#COPY ./onlinebookstore-${BUILD_ID}.war /usr/local/tomcat/webapps/

# havent tested
#RUN cd /usr/local/tomcat/webapps/ && curl -u admin:admin -o onlinebookstore-${BUILD_ID}-v1.war "http://20.74.182.192:8081/repository/cp4i-project/onlinebookstore-${BUILD_ID}/v1/onlinebookstore-${BUILD_ID}-v1.war" -L


#worked too#
RUN cd /usr/local/tomcat/webapps/ && wget http://${username}:${password}@20.74.182.192:8081/repository/cp4i-project/onlinebookstore-${BUILD_ID}/v1/onlinebookstore-${BUILD_ID}-v1.war
RUN ls -lh /usr/local/tomcat/webapps/
EXPOSE 8080

#CMD [“catalina.sh”, “run”]
