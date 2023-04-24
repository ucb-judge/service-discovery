FROM eclipse-temurin:11-jdk-alpine

EXPOSE 8711

VOLUME /tmp

ENV CONFIG_SERVER_URI="CONFIG_SERVER_URI"
ENV CONFIG_SERVER_USER="CONFIG_SERVER_USER"
ENV CONFIG_SERVER_PASSWORD="CONFIG_SERVER_PASSWORD"

ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java","-cp","app:app/lib/*","com.ucbjudge.servicediscovery.ServiceDiscoveryApplicationKt"]