FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .
# On compile et on garde tout dans la meme image
RUN mvn clean package -DskipTests

# On simplifie l'acces au JAR
RUN cp target/*-shaded.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-Dspark.port=8080","-jar","app.jar"]
