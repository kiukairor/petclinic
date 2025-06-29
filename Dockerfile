FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY target/ui.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar", "--server.address=0.0.0.0"]


# # The petclinic project uses Spring Boot's layered JAR feature,
# # For optimisation, we will extract the layers to make a multi-stage Docker build.
# # This will allow to optimise rebuild times and reduce image size.


# FROM eclipse-temurin:17-jre-alpine AS extract
# ARG JAR_FILE=<PATH TO JAR>
# WORKDIR /app

# # Copy the layered jar
# COPY ${JAR_FILE} app.jar

# # Extract layers
# RUN java -Djarmode=layertools -jar app.jar extract

# # ---- Stage 2: Build final image with layers ----
# FROM eclipse-temurin:17-jre-alpine
# WORKDIR /app

# # Copy layers from the extract stage 
# ##  Notes 
# # ➜  target jar xf ui.jar BOOT-INF/layers.idx
# # ➜  target ls
# # BOOT-INF  spring-petclinic-3.5.0-SNAPSHOT.jar  ui.jar
# # ➜  target cd BOOT-INF
# # ➜  BOOT-INF ls
# # layers.idx
# # ➜  BOOT-INF cat layers.idx
# # - "dependencies":
# #   - "BOOT-INF/lib/"
# # - "spring-boot-loader":
# #   - "org/"
# # - "snapshot-dependencies":
# # - "application":
# #   - "BOOT-INF/classes/"
# #   - "BOOT-INF/classpath.idx"
# #   - "BOOT-INF/layers.idx"
# #   - "META-INF/"

# COPY --from=extract /app/dependencies/ ./
# COPY --from=extract /app/spring-boot-loader/ ./
# COPY --from=extract /app/snapshot-dependencies/ ./
# COPY --from=extract /app/application/ ./

# # Expose port 
# EXPOSE 8080

# # Run the app
# ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
