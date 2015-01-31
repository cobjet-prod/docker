FROM clouderg/dsubuntu14
MAINTAINER Cobjet Admin <admin@cobjet.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get install -y haproxy

VOLUME ["/etc/haproxy"]
ADD run.sh /run.sh

CMD ["/run.sh"]
