#!/bin/sh
# Install by typing:
# wget -q -O - https://raw.githubusercontent.com/martinhetschel/minidlna/master/minidlna.sh | bash 

docker stop minidlna
docker rm minidlna

docker pull geekduck/minidlna

docker run -d --name minidlna \
  --net=host \
  -p 8200:8200 \
  -p 1900:1900/udp \
  -v /var/storage/minidlna/Music:/opt/Music \
  -v /var/storage/minidlna/Video:/opt/Videos \
  -v /var/storage/minidlna/Pictures:/opt/Pictures \
  -v /var/storage/minidlna/minidlna.conf:/etc/minidlna.conf \
  geekduck/minidlna
