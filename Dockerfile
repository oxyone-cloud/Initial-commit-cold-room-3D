FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# 1. Compilation
RUN mvn clean package -DskipTests

# 2. On trouve le fichier JAR le plus gros dans target/ et on le renomme en app.jar
# Cela évite de se tromper de nom (shaded ou pas)
RUN find target/ -name "*.jar" -type f -exec ls -S {} + | head -n 1 | xargs -I {} cp {} app.jar

# 3. Vérification pour le log de Render
RUN ls -lh app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
