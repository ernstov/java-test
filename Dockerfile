FROM maven:3.6.3-jdk-8
COPY . /app
WORKDIR /app
RUN mvn clean install
EXPOSE 8080
CMD ["java", "-jar", "target/sample-0.0.1-SNAPSHOT.jar"]