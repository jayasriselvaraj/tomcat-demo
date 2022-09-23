FROM alpine

RUN apk update

RUN apk add openjdk11

ENV CATALINA_HOME /opt/tomcat

ENV PATH $CATALINA_HOME/bin:$PATH

RUN mkdir -p "$CATALINA_HOME"

WORKDIR $CATALINA_HOME /opt/tomcat

ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz .

RUN tar -xvzf  apache-tomcat-8.5.82.tar.gz

RUN mv apache-tomcat-8.5.82/* /opt/tomcat

EXPOSE 8080

COPY ./webapp.war /opt/tomcat/webapps

#COPY ./webapp.war $CATALINA_HOME/webapps
CMD ["/opt/tomcat/bin/catalina.sh","run"]
