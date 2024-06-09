FROM openjdk:21
EXPOSE 8088
ADD site/target/ROOT.jar devops-integration.jar
ENTRYPOINT ["java", "-jar", "devops-integration.jar"]
