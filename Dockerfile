FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk
# On prend le JAR le plus gros généré (celui avec toutes les dépendances)
COPY --from=build /target/cold-room-3d-1.0-shaded.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Dspark.port=8080","-jar","/app.jar"]
