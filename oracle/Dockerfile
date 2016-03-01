FROM wnameless/oracle-xe-11g

MAINTAINER Daniel Keler <danielk@jfrog.com>

ADD run.sh /usr/sbin/run.sh

RUN chmod +x /usr/sbin/run.sh

WORKDIR /usr/sbin/

CMD /usr/sbin/run.sh && /usr/sbin/sshd -D