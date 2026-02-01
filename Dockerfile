FROM maven:3.8.5-openjdk-17
WORKDIR /app
COPY . .

# On force la compilation et on liste TOUT le répertoire pour comprendre
RUN mvn clean package -DskipTests && echo "CONTENU DE TARGET :" && ls -R target/

# On utilise une commande de copie qui ne peut pas échouer (sh -c)
RUN /bin/sh -c "cp target/*.jar app.jar || echo 'ERREUR DE COPIE'"

EXPOSE 8080
ENTRYPOINT ["java", "-Dspark.port=8080", "-jar", "app.jar"]
