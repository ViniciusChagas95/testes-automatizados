# Use a imagem base do JDK 21
FROM openjdk:21-jdk-slim

# Crie um diretório para a aplicação
WORKDIR /app

# Copie o arquivo JAR da aplicação para o diretório /app no container
COPY target/catastrofes-ambientais-0.0.1-SNAPSHOT.jar app.jar

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
