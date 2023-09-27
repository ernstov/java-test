FROM maven:3.6.3-openjdk-8
WORKDIR /app
COPY . /app
RUN mvn package
ENTRYPOINT ["java", "-jar", "target/sample-0.0.1-SNAPSHOT.jar"]