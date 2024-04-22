# Stage 1: Build stage
# FROM python:3-alpine AS builder
# WORKDIR /app
# RUN python3 -m venv venv
# ENV VIRTUAL_ENV=/app/venv
# ENV PATH="$VIRTUAL_ENV/bin:$PATH"
# COPY requirements.txt .
# RUN pip install -r requirements.txt

# Stage 2: Runtime stage
FROM jenkins/jenkins:jdk17
EXPOSE 8080
# COPY --from=builder /app/dist /opt/app  # Copy the built Python application
# COPY jenkins.war /usr/local/bin/jenkins.war  # Copy initial Jenkins configuration

# Set CMD to run Jenkins with desired arguments
# CMD ["docker-wait", "--timeout", "300", "-t", "^jenkins$", "/usr/local/bin/jenkins.war"]
CMD ["/usr/local/bin/jenkins.sh"]
