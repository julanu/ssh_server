FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Bucharest

# Update and install packages
RUN apt-get update
RUN apt-get install openssh-server sudo net-tools -y

# Create user and specify rights
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test_acc
RUN usermod -aG sudo test_acc
RUN echo "test_acc:1234" | chpasswd

# Start ssh service and expose port 22
RUN service ssh start
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
