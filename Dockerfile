# FROM python:3.13.0b4-slim-bookworm
FROM ubuntu:22.04

# Set env variables to prevent from prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && apt-get clean

# Set the working directory
WORKDIR /app/django/count-app


# Copy the requirements file
COPY requirements.txt .

# Install virtual env and packages
RUN pip install virtualenv && \
    virtualenv venv && \
    . venv/bin/activate && \
    pip install -r requirements.txt

# Copy everything else
COPY . .

# Expose port
EXPOSE 8000

# Run the app
# CMD ["/app/django/count-app/venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]

