# Etapa 1: construir el JAR con Maven
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copiar el pom y descargar dependencias (cache)
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Copiar el código fuente
COPY src ./src

# Compilar y empaquetar (sin tests para ir más rápido)
RUN mvn -B package -DskipTests

# Etapa 2: imagen ligera solo con el JAR
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copiar el JAR generado
COPY --from=build /app/target/*.jar app.jar

# Comando de arranque
ENTRYPOINT ["java", "-jar", "app.jar"]
