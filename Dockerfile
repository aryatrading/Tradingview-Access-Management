# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app
RUN apt-get update && apt-get install -y curl wget && rm -rf /var/lib/apt/lists/*

# Copy the project files to the container
COPY requirements.txt /app/

# Install dependencies
RUN pip3 install --no-cache-dir -r /app/requirements.txt
# Copy the rest of the application files
COPY . /app

# Expose the port the app runs on
EXPOSE 8000

# Define the command to run the application
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "server:app"]
