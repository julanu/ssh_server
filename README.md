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

## Generate pair of ssh keys

### Create the key pair on the client machine:
`$ ssh-keygen -t rsa`

### Copy the public key into the new machine’s authorized_keys file with the ssh-copy-id command:
`$ ssh-copy-id test_acc@0.0.0.0`

### You can now login using the identity file:
`$ ssh -i /home/julaw/.ssh/id_rsa test_acc@0.0.0.0`

### Execute remote commands that require elevated access through SSH, by getting passwordless access in the sudoers file by adding the lines bellow in `/etc/sudoers` using `visudo` in your container, for example:

```bash
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL
test_acc ALL=NOPASSWD: /usr/bin/ls
```
You can now execute that command remotely through ssh without being prompted for a password: <br/>
`$ ssh -t -i /path/to/id_rsa test_acc@0.0.0.0 sudo /usr/bin/ls -la`
