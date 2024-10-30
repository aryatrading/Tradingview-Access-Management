# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the project files to the container
COPY requirements.txt /app/

# Install dependencies
RUN pip3 install --no-cache-dir -r /app/requirements.txt
# Copy the rest of the application files
COPY . /app

# Expose the port the app runs on
EXPOSE 8000

# Define the command to run the application
CMD ["python", "main.py"]
