FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# Compilation avec nettoyage
RUN mvn clean package -DskipTests

# On utilise une commande plus robuste pour copier le JAR
RUN cp target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-Dspark.port=8080","-jar","app.jar"]
