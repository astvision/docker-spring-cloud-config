FROM maven:3-openjdk-8

COPY pom.xml src /tmp/
RUN mvn clean install
