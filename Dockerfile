FROM maven:3.8.2-openjdk-8 as warfilebuilder
ARG TCDIR=/tomcatuser
ARG BUILD_VERSION=${BUILD_VERSION}
WORKDIR ${TCDIR}
COPY . .
RUN mvn clean package

FROM tomcat:10.0.27
ARG TCDIR=/tomcatuser
ARG BUILD_VERSION=${BUILD_VERSION}
COPY --from=warfilebuilder ${TCDIR}/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps
