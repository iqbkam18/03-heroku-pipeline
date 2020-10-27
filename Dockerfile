FROM maven:3.6-jdk-11 as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests


FROM adoptopenjdk/openjdk11:alpine-slim
COPY --from=builder/app/target/*j.ar/app/application.jar
ENTRYPOINT ["java","-jar","/app/application.jar"]