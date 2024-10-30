# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Install Poetry
RUN pip install poetry

# Copy the project files to the container
COPY pyproject.toml poetry.lock /app/

# Install dependencies
RUN poetry config virtualenvs.create false && poetry install --no-dev

# Copy the rest of the application files
COPY . /app

# Expose the port the app runs on
EXPOSE 8000

# Define the command to run the application
CMD ["poetry", "run", "gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "main:app"]
