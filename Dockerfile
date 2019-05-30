FROM alpine:latest
ENV karateVersion 0.9.2

ENV AWS_ACCESS_KEY_ID AKIARYGZXFUU3EEBIW5M
ENV AWS_SECRET_ACCESS_KEY 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
ENV AWS_REGION eu-central-1

MAINTAINER Marta Arcones "marta.arcones@gmail.com"

RUN apk update && apk upgrade
RUN apk -v --update add python py-pip openjdk8-jre wget
RUN pip install --upgrade awscli
RUN apk -v --purge del py-pip && rm /var/cache/apk/*

RUN mkdir bucket && cd bucket

RUN wget https://dl.bintray.com/ptrthomas/karate/karate-${karateVersion}.jar
RUN aws s3 sync s3://kumite .

CMD java -jar karate-${karateVersion}.jar * && aws s3 sync . s3://kumite