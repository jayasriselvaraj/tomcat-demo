FROM alpine:latest

RUN apk update

RUN apk add openjdk11-jre-headless

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat

ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz .

RUN tar -xvzf  apache-tomcat-8.5.82.tar.gz

RUN mv apache-tomcat-8.5.82/* /opt/tomcat

EXPOSE 8080

CMD ["/opt/tomcat/catalina.sh","run"]
