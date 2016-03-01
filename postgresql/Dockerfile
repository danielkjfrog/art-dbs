FROM postgres:9.1

MAINTAINER Daniel Keler <danielk@jfrog.com>

ADD run.sh /usr/sbin/run.sh

RUN chmod +x /usr/sbin/run.sh

WORKDIR /usr/sbin/

CMD postgres && /usr/sbin/run.sh