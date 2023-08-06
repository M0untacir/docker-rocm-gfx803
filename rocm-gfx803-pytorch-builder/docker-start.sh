#!/bin/bash
source ../build-args.sh

drun() {
   sudo docker run -it --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --shm-size 16G --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $HOME/dockerx:/dockerx -v $(pwd):/current "$@"
}

docker_image_name="reda2020/rocm-gfx803-pytorch-builder"
docker_image_tag="ubuntu${ARG_UBUNTU_VERSION}-rocm${ARG_ROCM_VERSION}-complete"

drun --rm "$docker_image_name:$docker_image_tag" "$@"


# docker create --name dummy "$docker_image_name:$docker_image_tag"
# docker cp dummy:/current /home
# docker rm -f dummy


# docker push "$docker_image_name:$docker_image_tag"
# docker tag "$docker_image_name:$docker_image_tag" "$docker_image_name:latest"
# docker push "$docker_image_name:latest"
