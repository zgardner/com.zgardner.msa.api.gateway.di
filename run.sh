container_name="com.zgardner.msa.api.gateway.di"
docker_registry_path="registry.docker.msa.zgardner.com:5000"
tag_name="$docker_registry_path/$container_name:latest"
host_api_port="80"
container_api_port="80"

echo "Pulling latest tag $tag_name..."
docker pull $tag_name

echo "Killing container $container_name..."
docker kill $container_name

echo "Removing container $container_name..."
docker rm $container_name

echo "Starting contaner $container_name..."
docker run -d --name $container_name -p $host_api_port:$container_api_port $tag_name
