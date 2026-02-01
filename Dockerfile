# Phase 1 : Construction
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Phase 2 : Exécution
FROM openjdk:17-jdk-slim
WORKDIR /app

# On copie tout le contenu de target pour être sûr
COPY --from=build /app/target/*.jar ./

# Script magique : on identifie le plus gros JAR (le shaded) et on le nomme app.jar
RUN ls -S *.jar | head -n 1 | xargs -I {} mv {} app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
