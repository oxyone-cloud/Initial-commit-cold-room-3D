# Étape 1 : Construction
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Étape 2 : Exécution
FROM openjdk:17-jdk-slim
WORKDIR /app

# On utilise une commande intelligente pour ne prendre que le JAR "shaded"
COPY --from=build /app/target/*-shaded.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-Dspark.port=8080","-jar","app.jar"]
