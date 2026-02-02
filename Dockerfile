FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# 1. Compilation
RUN mvn clean package -DskipTests

# 2. On cherche le JAR le plus lourd et on le renomme (évite les erreurs de nommage)
RUN find target/ -name "*.jar" -type f -exec ls -S {} + | head -n 1 | xargs -I {} cp {} app.jar

# 3. Vérification de sécurité
RUN ls -lh app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
