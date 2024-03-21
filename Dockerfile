# Use an official Python runtime as the base image
FROM python:3.9-slim AS base

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Create a directory for the application code
RUN mkdir /app/myapp

# Switch to a new intermediate image for installing dependencies
FROM base AS dependencies

# Install any needed packages specified in requirements.txt
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Switch to a new intermediate image for building application
FROM dependencies AS build

# Copy the rest of the application code into the container
COPY . /app

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Switch back to the base image
FROM base AS final

# Copy only the necessary files from the previous stages
COPY --from=build /app /app

# Define the command to run your application
CMD ["python", "app.py"]
