HAProxy
=======

This is a docker configuration for running HAProxy in front of your other
containers. You can use this to gracefully deploy any application with a tcp
socket.

You will need to mount a directory that contains a `haproxy.tmpl` file. This
file is identical to a standard HAProxy config, but any instance of
`$HOST_IP` will be replaced with the ip address of the host machine of the
HAProxy container. Here is a simple example file that forwards all traffic from
port 8080 to port 42384:

```
    # haproxy.tmpl
    global
        maxconn 2000
        user haproxy
        group haproxy

    defaults
        timeout connect  5000
        timeout client  10000
        timeout server  10000

    listen localhost 0.0.0.0:8080
        mode tcp
        server backend $HOST_IP:42384
```

Put that file into a directory, then mount that directory as you run haproxy:

```
    docker run -v /my/host/configs:/etc/haproxy:ro -p 8080:8080 --name=haproxy cobjet/haproxy
```

HAProxy will watch the template file for changes and gracefully reload itself
for new configurations.
