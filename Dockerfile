

FROM alpine:latest
RUN apk update
RUN apk add openjdk11
RUN mkdir /usr/local/tomcat
WORKDIR /usr/local/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz .
RUN tar -xvzf apache-tomcat-8.5.82.tar.gz
RUN mv apache-tomcat-8.5.82/* /usr/local/tomcat
EXPOSE 8080
COPY webapp.war /usr/local/tomcat/webapps/
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]




#ARG BASE_IMAGE=alpine
#ARG ALPINE_VERSION=LATEST
#FROM ${BASE_IMAGE}:${ALPINE_VERSION}
#RUN mkdir /opt/tomcat/
#WORKDIR /opt/tomcat
#RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
#RUN tar xvfz apache*.tar.gz
#RUN mv apache-tomcat-9.0.65/* /opt/tomcat/.
#RUN java -version
#WORKDIR /opt/tomcat/webapps
#ENV TOMCAT_MAJOR=9 
#TOMCAT_VERSION=9
#TOMCAT_HOME+/opt/tomcat 
#CATALINA_HOME=opt/tomcat 
#CATALINA_OUT=/dev/null
#FROM alpine:latest
#RUN apk --update curl openjdk11 && 
#curl -jksSL -o /tmp/apache-tomcat.tar.gz https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
#RUN apk add openjdk11
#RUN mkdir /opt/tomcat/
#WORKDIR /opt/tomcat
#ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz .
#RUN tar -xvzf  apache-tomcat-8.5.82.tar.gz
#RUN mv apache-tomcat-8.5.82/* /opt/tomcat
#COPY webapp.war ${TOMCAT_HOME}/webapps/
#COPY webapp.war /opt/tomcat/webapps
#CMD ["/opt/tomcat/bin/catalina.sh", "run"]
#EXPOSE 8080
