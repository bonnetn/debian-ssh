FROM debian:stretch

RUN apt-get update && apt-get -y install openssh-server sudo

RUN sed -i 's/PermitRootLogin .*/PermitRootLogin without-password/' /etc/ssh/sshd_config
RUN mkdir -p /root/.ssh


CMD sh -c '(echo "${SSH_KEY}" > /root/.ssh/authorized_keys) && mkdir -p /var/run/sshd && /usr/sbin/sshd -D'
