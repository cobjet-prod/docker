# worker DOCKER IMAGE
--------

1. docker run --privileged -d --name worker -v `pwd`/haproxy-override:/haproxy-override -p 8888:8888 -p 4430:4430 cobjet/worker
2. docker run --privileged -t -i --rm --link worker:worker cobjet/worker /bin/bash

NOTES:
- VOLUME ["/var/log/supervisor", "/etc/supervisor/conf.d", "/usr/local", "/data", "/haproxy-override", "/home/devops", "/home/docker", "/home/www/nodeapp" ]
- EXPOSE 8888 4430
