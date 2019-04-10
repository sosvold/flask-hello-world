# Fetch system dependencies from Ubuntu 18.04
FROM ubuntu:18.04

# Information about the maintainer of this docker image
MAINTAINER Stian Osvold "stianosvold@outlook.com"

# Update the repository cache
RUN apt-get update -y

# Install required system dependencies
RUN apt-get install -y python3-pip python3-dev build-essential

# Initialize the app
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install required python dependencies
RUN pip3 install -r requirements.txt

# Run the app
ENTRYPOINT [ "python3" ]
CMD [ "flask-hello-world.py" ]
