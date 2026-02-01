FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# 1. On compile et on affiche le résultat de target
RUN mvn clean package -DskipTests && ls -l target/

# 2. On cherche le fichier JAR (le plus gros) et on le déplace
RUN JARDER=target/simulation-3d-1.0-SNAPSHOT.jar && cp $JARDER app.jar

# 3. Vérification finale avant lancement
RUN ls -lh app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
