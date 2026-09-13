FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /src
COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -q test package
FROM eclipse-temurin:21-jre
WORKDIR /app
RUN useradd --system --uid 10001 app && mkdir -p /app/data && chown -R app:app /app
COPY --from=build /src/target/warranty-claim-gateway-0.1.0.jar /app/service.jar
USER app
ENV APP_DB_PATH=/app/data/service.sqlite3
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/service.jar"]
