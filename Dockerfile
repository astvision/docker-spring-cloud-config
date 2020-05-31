# ----- BASE -----
FROM maven:3-openjdk-8 AS base

# ----- BUILD -----
FROM base AS build
RUN mkdir -p /home/spring
WORKDIR /home/spring
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src src
RUN mvn clean install

# ----- PROD -----
FROM openjdk:8-jre-alpine AS prod
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
RUN mkdir -p /home/spring
WORKDIR /home/spring
COPY --chown=spring:spring --from=build /home/spring/target/*.war app.war

EXPOSE 8888
# ENTRYPOINT ["java" "-jar", "app.war"]
ENTRYPOINT java $JAVA_OPTS -jar app.war
