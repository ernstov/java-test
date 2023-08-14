FROM maven:3.8.2-openjdk-8-slim AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=build /usr/src/app/target/sample-0.0.1-SNAPSHOT.jar /usr/local/lib/sample.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/sample.jar"]