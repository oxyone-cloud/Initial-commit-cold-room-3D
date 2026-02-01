FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
# On force le nom du JAR pendant le build Maven
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
# On cherche le JAR généré et on le force en app.jar dans l'image finale
COPY --from=build /app/target/*.jar ./app.jar

# Sécurité : on vérifie que le fichier est bien là
RUN ls -lh app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
