FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# 1. On compile
RUN mvn clean package -DskipTests

# 2. On liste le contenu de target pour le log et on copie avec un joker
RUN ls -l target/ && cp target/*-shaded.jar app.jar || cp target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-Dspark.port=8080","-jar","app.jar"]
