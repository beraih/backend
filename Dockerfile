FROM gradle:7.6.0-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle clean build -x test
 
# Aşama 2: Çalıştırma
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /app/build/libs/your-app-name.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
