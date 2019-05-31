FROM alpine:latest

MAINTAINER Marta Arcones "marta.arcones@gmail.com"

ENV KARATE_VERSION 0.9.2

RUN apk update && apk upgrade && \
    apk -v --update add python py-pip openjdk8-jre wget && \
    pip install --upgrade awscli && \
    apk -v --purge del py-pip && rm /var/cache/apk/*

ADD https://dl.bintray.com/ptrthomas/karate/karate-${KARATE_VERSION}.jar bucket/

CMD cd bucket && \
    aws s3 sync s3://${BUCKET_NAME} . && \
    java -jar karate-${KARATE_VERSION}.jar * && \
    aws s3 sync target s3://${BUCKET_NAME}/target