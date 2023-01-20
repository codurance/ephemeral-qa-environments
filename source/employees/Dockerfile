ARG BASE_IMAGE='openjdk:8-jdk-alpine'

FROM ${BASE_IMAGE} AS builder

ADD . "/app"
RUN cd "/app" && ./gradlew clean build jar

FROM ${BASE_IMAGE}

COPY --from=builder "/app/app/build/libs/app.jar" /app.jar

EXPOSE 4567

ENTRYPOINT ["java", "-jar", "/app.jar"]