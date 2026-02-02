# Utilisation d'une image unique et stable
FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# Compilation et renommage immédiat pour éviter toute confusion
RUN mvn clean package -DskipTests &&     mv target/*.jar app.jar

# Vérification visuelle dans les logs
RUN ls -lh app.jar

EXPOSE 8080
# Lancement direct
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
