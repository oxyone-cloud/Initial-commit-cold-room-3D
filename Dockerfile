FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# 1. Compilation
RUN mvn clean package -DskipTests

# 2. On déplace UNIQUEMENT le JAR complet (shaded) vers app.jar
RUN mv target/*-shaded.jar app.jar

# 3. On nettoie le reste pour être léger
RUN rm -rf target

EXPOSE 8080
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
