# Utiliser une image Maven avec Java 11
FROM maven:3.9.0-eclipse-temurin-11

# Copier tout le projet dans le conteneur
COPY . /app
WORKDIR /app

# Build Maven et créer le jar avec toutes les dépendances
RUN mvn clean package

# Définir le port via format clé=valeur (warning Docker corrigé)
ENV PORT=8080
EXPOSE 8080

# Commande pour lancer le serveur Spark
CMD ["java", "-cp", "target/simulation-3d-1.0-SNAPSHOT.jar", "com.coldroom.Main"]
