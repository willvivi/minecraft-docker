FROM openjdk:8u212-jre-alpine

WORKDIR /app
ARG FORGE_VERSION

RUN wget -O forge.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/$FORGE_VERSION/forge-$FORGE_VERSION-installer.jar 

RUN java -jar forge.jar --installServer
COPY ./eula.txt .
RUN chmod 775 ./forge.jar

EXPOSE 25565 25575

CMD ["java", "-Xmx4096M", "-jar", "forge.jar"]

