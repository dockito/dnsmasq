FROM ubuntu:14.04

RUN apt-get update \
  && apt-get install -q -y dnsmasq \
  && chmod +s /usr/sbin/dnsmasq \
  && chmod +s /sbin/start-stop-daemon

RUN echo "address=/local.dockito.org/10.10.10.10" >> /etc/dnsmasq.conf

EXPOSE 53

CMD dnsmasq -d
