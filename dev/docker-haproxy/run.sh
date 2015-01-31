#!/bin/bash
declare -r INTERVAL=2
declare -r PIDFILE=/var/run/haproxy.pid
declare -r TEMPLATE=/etc/haproxy/haproxy.tmpl
declare -r CONF=/haproxy.cfg

export HOST_IP=$(ip -4 route list 0/0 | awk '{print $3}')

# Watch the template file for changes and restart the service
poll() {
    local last_update=`stat -c %Z $TEMPLATE`
    while [ 1 ]; do
        local new_update=`stat -c %Z $TEMPLATE`
        if [ "$new_update" != "$last_update" ]; then
            last_update="$new_update"
            restart_service
        fi
        sleep $INTERVAL
    done
}

# Rebuild config file and graceful reload of haproxy
restart_service() {
    rebuild_config
    echo "Restarting HAProxy"
    set -x
    haproxy -p "$PIDFILE" -f "$CONF" -D -sf $(cat "$PIDFILE")
    set +x
}

# Replace $HOST_IP in template and write to conf file
rebuild_config() {
    echo "Rebuilding config"
    sed -e 's/$HOST_IP/'$HOST_IP'/g' "$TEMPLATE" > "$CONF"
}

main() {
    rebuild_config
    haproxy -p "$PIDFILE" -f "$CONF" -D
    poll
}

main "$@"
