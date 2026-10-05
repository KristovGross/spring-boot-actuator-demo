FROM maven:3.8.8-eclipse-temurin-8 AS build

WORKDIR /workspace

COPY pom.xml .

RUN mvn -B dependency:go-offline

COPY src ./src

RUN mvn -B clean package

FROM eclipse-temurin:8-jre-jammy

WORKDIR /app

RUN groupadd --system spring && \
    useradd --system --gid spring spring

COPY --from=build \
    --chown=spring:spring \
    /workspace/target/actuator-demo-0.0.1-SNAPSHOT.jar \
    /app/app.jar

USER spring:spring

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
