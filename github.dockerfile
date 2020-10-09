FROM openjdk:11.0.8-slim

WORKDIR /app
COPY . /app/temp
RUN chmod +x ./temp/gradlew
RUN cd ./temp && ./gradlew bootJar
RUN cp ./temp/build/libs/*.jar ./app.jar
RUN rm -rf ./temp
ENTRYPOINT ["java", "-jar", "./app.jar"]
EXPOSE 8888