
FROM adoptopenjdk/openjdk11:alpine-slim
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]