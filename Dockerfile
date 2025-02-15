FROM ubuntu:latest AS build
RUN apt-get update && apt-get install -y openjdk-8-jdk
COPY . .
# Build the application
RUN mvn clean package -DskipTestsFROM openjdk:8-jre-slim
EXPOSE 8080
# Copy built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]