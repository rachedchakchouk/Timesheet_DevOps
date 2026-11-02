# openjdk:8-jre-alpine est abandonnée (plus de mises à jour) : image Eclipse Temurin maintenue, même Java 8
FROM eclipse-temurin:8-jre-alpine
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \JAVA_OPTS=""
WORKDIR /app
ADD target/*.jar timesheet_devops.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/timesheet_devops.jar"]