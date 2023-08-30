FROM maven:3.6.3-openjdk-8
COPY . /app
WORKDIR /app
RUN mvn package
CMD ["java","-jar","target/sample-0.0.1-SNAPSHOT.jar"]
