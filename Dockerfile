FROM maven:3.6.0-jdk-8-alpine as builder
WORKDIR /app
COPY . /app
RUN mvn clean package

FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY --from=builder /app/target/sample-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/sample-0.0.1-SNAPSHOT.jar"]