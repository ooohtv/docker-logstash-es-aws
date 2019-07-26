FROM docker.elastic.co/logstash/logstash:7.2.0

RUN bin/logstash-plugin install logstash-output-amazon_es

COPY logstash.yml /usr/share/logstash/config/
COPY logstash.conf /usr/share/logstash/pipeline/
ADD launcher.sh /tmp

CMD /bin/sh /tmp/launcher.sh