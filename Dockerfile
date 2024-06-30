# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /code

# Install dependencies
RUN apt-get update \
    && apt-get install -y gcc python3-dev musl-dev \
    && apt-get install -y default-libmysqlclient-dev \
    && apt-get install -y pkg-config

COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Copy project
COPY . /code/

# Run the application
CMD ["python", "djangoProject/manage.py", "runserver", "0.0.0.0:8000"]