FROM jenkins/jenkins:jdk17 AS jenkins
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]