FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# 1. Compilation
RUN mvn clean package -DskipTests

# 2. On identifie le plus gros JAR et on le renomme en app.jar
RUN ls -S target/*.jar | head -n 1 | xargs -I {} mv {} app.jar

EXPOSE 8080

# Lancement avec configuration du port pour Spark
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
