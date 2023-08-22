FROM maven:3.6.0-jdk-8
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN mvn clean install -DskipTests
ENTRYPOINT ["java", "-jar", "target/sample-0.0.1-SNAPSHOT.jar"]