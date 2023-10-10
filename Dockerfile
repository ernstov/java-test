FROM maven:3.6.3-openjdk-8
COPY . /app
WORKDIR /app
RUN mvn package -DskipTests
EXPOSE 8080
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "./target/sample-0.0.1-SNAPSHOT.jar"]