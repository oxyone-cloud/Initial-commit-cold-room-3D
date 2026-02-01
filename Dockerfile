FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
# Cette commande cherche le JAR de plus de 5Mo (le shaded) et le renomme app.jar
COPY --from=build /app/target/*.jar .
RUN find . -name "*.jar" -size +5M -exec mv {} app.jar \;

EXPOSE 8080
ENTRYPOINT ["java","-Dspark.port=8080","-jar","app.jar"]
