# Use the official Python image from the Docker Hub
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR /flaskblog


# Copy the project files
COPY . /flaskblog/

# Install dependencies
RUN pip install -r requirements.txt

# Expose the port that the app runs on
EXPOSE 8000

# Define the command to run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=3000"]
