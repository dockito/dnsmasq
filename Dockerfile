FROM ubuntu:14.04

RUN apt-get update \
  && apt-get install -q -y dnsmasq \
  && chmod +s /usr/sbin/dnsmasq \
  && chmod +s /sbin/start-stop-daemon

RUN cp /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

EXPOSE 53

ENV DOCKITO_HOST local.dockito.org
ENV DOCKITO_IP 10.10.10.10
ENV DOCKITO_DNS 8.8.8.8

COPY ./run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
