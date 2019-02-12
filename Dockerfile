FROM maven:3.6.0-jdk-8-alpine
MAINTAINER luis.robertop87@gmail.com

### ENV VARIABLES
ENV WILDFLY_HOME /opt/wildfly11
ENV WILDFLY_APP_FOLDER $WILDFLY_HOME/standalone/deployments
ENV WILDFLY_POSTGRES_MODULE $WILDFLY_HOME/modules/system/layers/base/org/postgres/main

## Install Wildfly 11
RUN mkdir -p $WILDFLY_HOME
RUN curl https://download.jboss.org/wildfly/11.0.0.Final/wildfly-11.0.0.Final.tar.gz --output wildfly11.tar.gz
RUN tar xvfz wildfly11.tar.gz -C $WILDFLY_HOME

## Register postgresql
RUN mkdir -p $WILDFLY_POSTGRES_MODULE
RUN cd $WILDFLY_POSTGRES_MODULE && curl https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar --output postgresql-9.4.1212.jar
ADD module.xml WILDFLY_POSTGRES_MODULE

