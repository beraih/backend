# Aşama 1: Build
FROM gradle:7.6.0-jdk17 AS build
WORKDIR /app
COPY . .
RUN ./gradlew bootJar --no-daemon

# Aşama 2: Run
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /app/build/libs/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
