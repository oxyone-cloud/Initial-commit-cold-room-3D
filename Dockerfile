FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# 1. On compile d'abord (Indispensable !)
RUN mvn clean package -DskipTests

# 2. On verifie et on copie le fichier genere
RUN cp target/cold-room-3d-1.0-shaded.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-Dspark.port=8080","-jar","app.jar"]
