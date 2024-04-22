# Stage 1: Build stage
FROM python:3-alpine AS builder
WORKDIR /app
RUN python3 -m venv venv
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
COPY requirements.txt .
RUN pip install -r requirements.txt

# Stage 2: Runtime stage
FROM jenkins/jenkins:jdk17 AS jenkins
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]