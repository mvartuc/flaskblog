# Use the official Python image from the Docker Hub
FROM python:3.9-slim-buster
# Install prerequisites
RUN apt-get update && apt-get install -y \
    curl \
    wget


# Set the env argument variables
ARG FLASK_APP
ARG EMAIL_PASS
ARG EMAIL_USER
ARG SECRET_KEY
ARG SQLALCHEMY_DATABASE_URI

# Set the environment variables
ENV FLASK_APP ${FLASK_APP}
ENV EMAIL_PASS ${EMAIL_PASS}
ENV EMAIL_USER ${EMAIL_USER}
ENV SECRET_KEY ${SECRET_KEY}
ENV SQLALCHEMY_DATABASE_URI ${SQLALCHEMY_DATABASE_URI}

# Set the working directory
WORKDIR /flaskblog

# Copy the project files
COPY . /flaskblog/

# Install dependencies
RUN pip install -r requirements.txt

# Expose the port that the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=3000"]
