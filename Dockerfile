FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# On compile - Maven va créer target/app-1.0-shaded.jar ou similaire
RUN mvn clean package -DskipTests

# On déplace tout ce qui finit par .jar dans le dossier parent sous le nom app.jar
# C'est la commande la plus simple possible
RUN cp target/*-shaded.jar app.jar || cp target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
