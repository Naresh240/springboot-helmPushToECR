FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install 

FROM java:8
WORKDIR /app
COPY --from=build /app/target/gs-spring-boot-0.1.0.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
