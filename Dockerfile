# The base image. This is just something that we will run our project on. It can be anything as long as it is IN THE CONTAINER.
FROM ubuntu:latest

# Install python and pip
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential

# Install Python modules needed by the Python app. Copy everything you have in a current directory to the new directory that will be called docker.
COPY . /docker/
RUN pip install --no-cache-dir -r /docker/requirements.txt

# Declare the port number the container should expose. The python app has a configuration that runs on Port 5000.
EXPOSE 5000

# Run the application
CMD ["python", "/docker/run.py"]
