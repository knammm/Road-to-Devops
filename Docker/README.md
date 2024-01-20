# Docker

## Scenario
We **Isolated** Services:
- To host our apps, we need infrastructure.
- We use VMs/Cloud Computing to setup infrastructure.
- We isolate our service in OS of VM.
- Because of Isolation, we end up of setting multiple VMs/Instances.
- VMs/Instances will be over provisioned.
- Results in High CapEx and OpEx (costly).

## VMs are expensive
- Every VM has OS.
- OS needs nurturing (maintain).
- OS needs license.
- OS takes time to boot.
- VMs are portable but bulky (cồng kềnh).
- VM needs resources for it OS (CPU, RAM, etc)
- All this to Isolate services.

## Container
- A process (isolated).
- A directory (namespace, cgroup).
- Contains necessary bin/lib in the directory.
- It has a IP address to connect to.
- Containers share the host machine's operating system (OS) kernel. Unlike virtual machines (VMs), which require a separate OS per application, containers optimize resource usage by sharing the kernel and only containing the necessary components for the application.
- A container is a standard unit of software that packages up: Code, Dependencies.

## VM vs Container
- Containers offer Isolation not Virtualization.
- Containers are OS virtualization.
- VMs are hardware virtualization.
- VM needs OS.
- Containers don't need OS.
- Containers use Host OS for compute resources.

## DockerHub
- It is a registry for Docker Images.
- **Docker Image:** A stopped Container like VM Image. Consist of multiple layers. An app will be bundled in an image. Containers run from Images.

## Docker basic commands
- `docker images`: Lists images locally.
- `docker run`: Create and start a new container.
- `docker ps`: Lists running containers.
- `docker ps -a`: Lists all containers.
- `docker exec`: Executes commands on containers.
- `docker start/stop/restart/rm`
- `docker rmi`: Remove docker images.
- `docker inspect`: Detail of container & Image.
- `-p 7080:80`: Maps port 7090 on the host to port 80 inside the container.
- `docker logs <container>`: Used to view the logs generated by a running or stopped Docker container. Use it for trouble shooting.

## Docker volume
- Containers are known for its volatile nature. We update through images then remove the previous containers to create new ones.
- What if we have a stateful container like MySQL database. If it happens to replace that container, all the data will be gone.

### Container Data
- The data doesn't persist when that container no longer exists, and it can be difficult to get the data out of the container if another process needs it.
- A container's writable layer is tightly coupled to the host machine where the container is running.

- Docker has two options for containers to store files in the host machine:
1. **Volume:** It will create a directory. All the container's data will go directly to that folder. Managed by Docker (`/var/lib/docker/volumes/`) on Linux.
2. **Bind Mounts:** Typically the same with Vagrant sync directory which means that you will bind an outside directory of your host to store the data of the container.