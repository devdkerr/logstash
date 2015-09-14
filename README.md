# logstash
dockerized log stash with monitoring

Dockerized LogStash
========================================

A dockerized LogStash service, with Monit monitoring.

Docker Run
----------------------------------------

```bash
docker run -d -p 2812 --link couchdb:couchdb --link elasticsearch:elasticsearch devdkerr/logstash
```

Docker-Compose Run
----------------------------------------

```yaml
logstash:
    image: devdkerr/logstash
    links:
     - couchdb:couchdb
     - elasticsearch:elasticsearch
    ports:
     - "2812"
```
