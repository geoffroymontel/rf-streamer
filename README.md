# RF-Streamer

## Installation

```bash
cd devops/vagrant
vagrant up dev --provision
```

## Icecast 2

* admin interface

http://admin:Q0A46L1cv81yi@172.16.0.25:8000/admin/stats.xml

## Liquidsoap

```bash
cd ~/src/rf-streamer/media
liquidsoap test1.liq
```

then point your browser to
http://172.16.0.25:8000/test1.m3u
