# Use an official Maven image as the base image
FROM maven:3.8.2-openjdk-17-slim AS build

EXPOSE 8999
# Set the working directory in the container
WORKDIR /app

# Copy the project's pom.xml and download the dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the source code to the container
COPY src ./src

# Build the application
RUN mvn package -DskipTests

RUN ls 

RUN cd target && ls  
# Use an appropriate Java runtime as the base image
FROM openjdk:22-oraclelinux8

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/apphealth-1.jar .

# Specify the command to run the application
CMD ["java", "-jar", "apphealth-1.jar"]

