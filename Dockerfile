FROM maven:3.6.3-jdk-8 as build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package -DskipTests

FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY --from=build /usr/src/app/target/*.jar app.jar
ENTRYPOINT ["java","-Dspring.profiles.active=production","-jar","/app.jar"]
EXPOSE 8080