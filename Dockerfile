FROM maven:3.6-jdk-8 as build
WORKDIR /app
COPY . /app
RUN mvn clean package
FROM openjdk:8-jdk-alpine
COPY --from=build /app/target/sample-0.0.1-SNAPSHOT.jar sample.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "sample.jar"]