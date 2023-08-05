#!/bin/bash
source ../build-args.sh

docker_image_name="reda2020/rocm-gfx803-pytorch-builder"
docker_image_tag="ubuntu${ARG_UBUNTU_VERSION}-rocm${ARG_ROCM_VERSION}-complete"

echo "Building $docker_image_name:$docker_image_tag ..."
docker_build -t "$docker_image_name:$docker_image_tag" .

docker create --name dummy "$docker_image_name:$docker_image_tag"
docker cp dummy:/path/to/file /home/
docker rm -f dummy


docker push "$docker_image_name:$docker_image_tag"
docker tag "$docker_image_name:$docker_image_tag" "$docker_image_name:latest"
docker push "$docker_image_name:latest"
