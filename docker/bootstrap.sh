#!/usr/bin/env sh
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /mnt/zfs/containers/portainer:/data portainer/portainer-ce