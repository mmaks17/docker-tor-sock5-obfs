FROM centos:latest
MAINTAINER mmaks
RUN yum install epel-release -y
RUN yum install tor -y
COPY ./obfs4proxy /usr/local/bin/
COPY ./tor/torrc /etc/tor/torrc
COPY ./tor/torsocks.conf /etc/tor/torsocks.conf
RUN chmod -R 775 /etc/tor
RUN chmod 775 /usr/local/bin/obfs4proxy
RUN chmod +x /usr/local/bin/obfs4proxy
USER toranon
ENTRYPOINT ["/usr/bin/tor"]

EXPOSE 5353 9050 9040 9051
