FROM alpine:latest
ENV karateVersion 0.9.2

MAINTAINER Marta Arcones "marta.arcones@gmail.com"

RUN apk update && apk upgrade
RUN apk -v --update add python py-pip openjdk8-jre wget
RUN pip install --upgrade awscli
RUN apk -v --purge del py-pip && rm /var/cache/apk/*

VOLUME target

RUN wget https://dl.bintray.com/ptrthomas/karate/karate-${karateVersion}.jar && \
    wget https://s3.eu-central-1.amazonaws.com/kumite/features/BasicSyntax.feature

CMD java -jar karate-${karateVersion}.jar *