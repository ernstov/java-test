FROM maven:3.6.0-jdk-8-slim AS build
COPY src /app/src
COPY pom.xml /app
WORKDIR /app
RUN mvn clean install

FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]