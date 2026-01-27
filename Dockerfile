FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk
WORKDIR /app
# On pointe vers le chemin absolu defini par WORKDIR
COPY --from=build /app/target/cold-room-3d-1.0-shaded.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Dspark.port=8080","-jar","app.jar"]
