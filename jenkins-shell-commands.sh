# Make sure that the jenkins user has been added to the docker group before running the script:
# $ sudo usermod -a -G docker jenkins

# Define the name of the container, should be the same name as the Git repository.
container_name="flask-hello-world"

# Check if the container is already running, if so, kill it.
if [[ ! "$(docker inspect $container_name 2> /dev/null)" == "[]" ]]; then
	docker kill "$container_name"
fi

# Check if the container already has an image, if so, delete it.
if [[ ! "$(docker images -q $container_name 2> /dev/null)" == "" ]]; then
	docker rmi "$container_name"
fi

# Build the container.
docker build -t "$container_name" /var/lib/jenkins/workspace/"$container_name"/

# Run the container.
docker run -d --rm -p 80:80 --name "$container_name" "$container_name"
