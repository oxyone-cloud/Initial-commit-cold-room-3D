# Utiliser une image Maven avec Java 11
FROM maven:3.9.0-eclipse-temurin-11

# Copier tout le projet dans le conteneur
COPY . /app
WORKDIR /app

# Build du projet
RUN mvn clean package

# Exposer le port pour Render
ENV PORT 8080
EXPOSE 8080

# Commande pour démarrer le serveur
CMD ["java", "-jar", "target/simulation-3d-1.0-SNAPSHOT-jar-with-dependencies.jar"]
