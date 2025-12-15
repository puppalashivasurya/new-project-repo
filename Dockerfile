FROM openjdk:17-slim
WORKDIR /app
COPY target/simple-java-app-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
