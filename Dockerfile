FROM ubuntu:trusty
MAINTAINER Daniel R. Kerr <daniel.r.kerr@gmail.com>

COPY logstash.gpg /root/logstash.gpg
RUN apt-key add /root/logstash.gpg \
 && echo "deb http://packages.elastic.co/logstash/1.5/debian stable main" > /etc/apt/sources.list.d/logstash.list

RUN apt-get update \
 && apt-get install -qq -y logstash monit openjdk-7-jre-headless supervisor \
 && apt-get clean \
 && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre

COPY monitrc /etc/monit/monitrc
RUN chmod 700 /etc/monit/monitrc \
 && chown root:root /etc/monit/monitrc

EXPOSE 2812

COPY supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord"]