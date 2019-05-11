FROM maven:3.6-jdk-11-slim as build
ARG MAVEN_CONFIG
WORKDIR /app
RUN env
COPY pom.xml .
RUN mvn -B -f pom.xml dependency:resolve
ENV artifactName $(mvn help:evaluate -Dexpression=project.name)
ENV version $(mvn help:evaluate -Dexpression=project.version)
ADD . /app
RUN env
RUN mvn test package

FROM openjdk:11-jdk-slim
ARG artifactName
ARG version
ENV artifact ${artifactName}-${version}.jar 
WORKDIR /app
COPY --from=build /app/target/${artifact} /app
EXPOSE 8080
CMD ["java -jar ${artifact}"] 