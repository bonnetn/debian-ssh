FROM debian:stretch

RUN apt-get update && apt-get -y install openssh-server sudo

RUN sed -i 's/PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir -p /root/.ssh && echo "${SSH_KEY}" > /root/.ssh/authorized_keys


CMD sh -c 'mkdir -p /var/run/sshd && /usr/sbin/sshd -D'
