FROM openjdk:8u212-jre-alpine

WORKDIR /app
ARG FORGE_VERSION
ENV FORGE_VERSION=${FORGE_VERSION}
RUN wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/$FORGE_VERSION/forge-$FORGE_VERSION-installer.jar

RUN java -jar forge-$FORGE_VERSION-installer.jar --installServer
COPY ./eula.txt .
RUN chmod 775 ./forge-$FORGE_VERSION-installer.jar

EXPOSE 25565 25575

CMD ["sh", "-c", "java -Xmx4096M -jar forge-${FORGE_VERSION}.jar"]

