FROM alpine:latest

MAINTAINER Marta Arcones "marta.arcones@gmail.com"

RUN apk update && apk upgrade
RUN apk -v --update add python py-pip openjdk8-jre
RUN pip install --upgrade awscli
RUN apk -v --purge del py-pip && rm /var/cache/apk/*

RUN aws --version
RUN java -version