# Use an appropriate base image with Java and Maven installed
FROM maven:3.8.4-openjdk-17-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project file(s) to the container
COPY ./shopapp-backend/shopapp/pom.xml .

# Download the project dependencies
RUN mvn dependency:go-offline -B

# Copy the entire project to the container
COPY  ./shopapp-backend .

# Build the Java Spring Boot project
RUN mvn -X -e package -DskipTests

# Set the main class as an environment variable
ENV MAIN_CLASS com.project.shopapp.ShopappApplication

# Set the command to run the Spring Boot application
CMD java -jar target/shopapp.jar $MAIN_CLASS
