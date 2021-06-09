FROM ubuntu

#ENV SHELL=/bin/bash
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install openssh-server -y
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh
RUN echo "root:123456" | chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
#ADD authorized_keys /root/.ssh/authorized_keys
#ADD run.sh /run.sh
#RUN chmod 755 /run.sh
ENV PORT=22
EXPOSE 22
CMD /usr/sbin/sshd -D
