FROM alpine

RUN apk update

RUN apk add openjdk11

ENV CATALINA_HOME /usr/local/tomcat

ENV PATH $CATALINA_HOME/bin:$PATH

RUN mkdir -p "$CATALINA_HOME"

WORKDIR $CATALINA_HOME /usr/local/tomcat

ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz .

RUN tar -xvzf  apache-tomcat-8.5.82.tar.gz

RUN mv apache-tomcat-8.5.82/* /usr/local/tomcat

EXPOSE 8080

#COPY ./sample.war /usr/local/webapps

COPY ./sample.war $CATALINA_HOME/webapps
