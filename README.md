# ssh_server
SSH Server running in a container using the latest Ubuntu image; for testing purposes

## Prerequisites to be installed:</b>
 - Docker Desktop 

## Build the image:
`docker image build -t ssh_test:1.0 .`

## Run the container:
`docker container run -p 22:22 --name ssh_test ssh_test:1.0`</br>
## To view running containers use: </br>
`docker ps` or `docker container ls`
```
$ docker ps

CONTAINER ID  IMAGE         COMMAND              CREATED        STATUS         PORTS                NAMES
a01821c76e8b  ssh_test:1.0  "/usr/sbin/sshd -D"  11 minutes ago Up 11 minutes  0.0.0.0:22->22/tcp   ssh_test
```

## Find the IP address of the container:
`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name>`

## Connect to the container
When running this, you will be able to connect using: `ssh test_acc@0.0.0.0`


### TO-DO
<input type="checkbox" /> SSH keys generation </br>
<input type="checkbox" /> Python code for remote execution </br>
<input type="checkbox" /> Subnet creation to assign IP to container


