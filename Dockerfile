FROM quay.io/pires/docker-jre:8u131_alpine3.6.2

LABEL version="v3.8.3-test-4"

ENV RELEASE_TAG v3.8.3-test-4
ENV ARTIFACT hazelcast-kubernetes-bootstrapper-3.8.3-SNAPSHOT.jar

RUN \
  apk add --update curl ca-certificates; apk upgrade; \
  curl -Lskj https://github.com/callstats-io/hazelcast-kubernetes-bootstrapper/releases/download/$RELEASE_TAG/$ARTIFACT \
  -o /bootstrapper.jar; \
  apk del wget; \
  rm /var/cache/apk/*

EXPOSE 5701 8080

CMD java -jar /bootstrapper.jar
