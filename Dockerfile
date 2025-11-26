# Etapa 1: construir el JAR con Maven
FROM eclipse-temurin:17-jdk AS build

WORKDIR /app

# Copiar el descriptor de Maven
COPY pom.xml .

# Descargar dependencias (esto ayuda al cache)
RUN mvn -B dependency:go-offline

# Copiar el código fuente
COPY src ./src

# Construir el proyecto (salta tests para ir más rápido aquí)
RUN mvn -B package -DskipTests

# Etapa 2: imagen ligera solo con el JAR
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copiar el JAR desde la etapa de build
COPY --from=build /app/target/github-actions-java-1.0-SNAPSHOT.jar app.jar

# Comando de arranque
ENTRYPOINT ["java", "-jar", "app.jar"]
