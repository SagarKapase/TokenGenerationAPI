FROM ubuntu:latest AS build
RUN apt-get update
RUN apt-get install openjdk-8-jdk-y
COPY . .
RUN .gradlew bootJar --no-daemon
FROM openjdk:8-jdk-slim
EXPOSE 8080
COPY --from=build /build/libs/demo-1.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]