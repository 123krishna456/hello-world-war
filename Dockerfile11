FROM maven:3.8.2-openjdk-8 as mavenbuilder
ARG TEST=/maven
ENV BUILD_VERSION=1.2.3
WORKDIR ${TEST}
COPY . .
RUN mvn clean package

FROM tomcat:jre8-temurin-focal
ARG TEST=/tomcat
ENV BUILD_VERSION=1.2.3
COPY --from=mavenbuilder ${TEST}/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps/
