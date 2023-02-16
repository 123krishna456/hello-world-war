FROM maven:3.8.2-openjdk-8 as warfilebuilder
ARG TCDIR=/tomcatuser
WORKDIR ${TCDIR}
COPY . .
RUN mvn clean package

FROM tomcat:10.0.27
ARG TCDIR=/tomcatuser
ENV BUILD_NUMBER=${BUILD_NUMBER}
COPY --from=warfilebuilder ${TCDIR}/target/hello-world-war-${BUILD_NUMBER}.war /usr/local/tomcat/webapps
