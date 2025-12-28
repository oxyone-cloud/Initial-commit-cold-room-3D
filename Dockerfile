# Image Maven avec Java 11
FROM maven:3.9.0-eclipse-temurin-11

# Copier le projet
COPY . /app
WORKDIR /app

# Build Maven
RUN mvn clean package

# Exposer le port pour Render
ENV PORT 8080
EXPOSE 8080

# Lancer le serveur Spark
CMD ["java", "-jar", "target/simulation-3d-1.0-SNAPSHOT-jar-with-dependencies.jar"]
