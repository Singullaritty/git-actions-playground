FROM adoptopenjdk/openjdk8:alpine-slim

EXPOSE 8080

ARG JAR_FILE=target/*.jar

RUN addgroup -S playground-group && adduser -S playground-user -G playground-group

COPY ${JAR_FILE} /home/playground-user/app.jar

USER playground-user

ENTRYPOINT ["java","-jar","/home/playground-user/app.jar"]