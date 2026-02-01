# Étape 1 : Construction
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
# On force Maven à créer le JAR directement avec le nom app.jar
RUN mvn clean package -DskipTests -Djar.finalName=app

# Étape 2 : Exécution
FROM openjdk:17-jdk-slim
WORKDIR /app

# On va chercher TOUT ce qui ressemble à un JAR dans target pour être certain
COPY --from=build /app/target/*.jar ./app.jar

# On donne les droits de lecture et on vérifie la présence du fichier
RUN chmod 644 app.jar && ls -l app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
