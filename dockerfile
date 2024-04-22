# Stage 1: Build stage
FROM python:3-alpine AS builder
WORKDIR /app
RUN python3 -m venv venv
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
COPY requirements.txt .
RUN pip install -r requirements.txt
# Build your Python application here (e.g., COPY . . , RUN pip freeze > requirements.txt)
# COPY . /app/dist  # Replace . with your build output directory (if applicable)

# Stage 2: Runtime stage
FROM jenkins/jenkins:jdk17
EXPOSE 8080
# Copy the built Python application (optional)
COPY /app/dist /opt/app  # Replace /app/dist with your actual source (if applicable)
# Copy initial Jenkins configuration (optional)
COPY jenkins.war /usr/local/bin/jenkins.war
# Set entrypoint to run Jenkins with desired arguments
ENTRYPOINT ["docker-wait", "--timeout", "300", "-t", "^jenkins$", "/usr/local/bin/jenkins.war"]
