FROM openjdk:17 AS jdk

FROM jenkins/jenkins:jdk17 AS jenkins

FROM jdk AS final
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]