# Use the official Python image from the Docker Hub
FROM python:3.8-slim-buster

# Set the working directory
WORKDIR /flaskblog

# Install dependencies
COPY requirements.txt /flaskblog/
RUN pip install -r requirements.txt

# Copy the project files
COPY . /flaskblog/

# Expose the port that the app runs on
EXPOSE 5000

# Define the command to run the application
CMD ["flask", "run", "--host=0.0.0.0"]
