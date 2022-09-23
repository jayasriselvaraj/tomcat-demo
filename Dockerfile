FROM alpine

RUN apk update

RUN apk add openjdk11

#ENV CATALINA_HOME /opt/tomcat

#ENV PATH $CATALINA_HOME/bin:$PATH

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

#RUN mkdir -p "$CATALINA_HOME"

RUN mkdir /usr/local/tomcat

#WORKDIR $CATALINA_HOME /opt/tomcat

WORKDIR /usr/local/tomcat

ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz .

RUN tar -xvzf  apache-tomcat-8.5.82.tar.gz

RUN mv apache-tomcat-8.5.82/* /usr/local/tomcat

EXPOSE 8080

COPY ./webapp.war /usr/local/tomcat/webapps

#COPY ./webapp.war $CATALINA_HOME/webapps

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
