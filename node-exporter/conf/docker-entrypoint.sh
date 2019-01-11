#!/bin/sh -e

NODE_NAME=$(cat /etc/nodename)
NODE_ENV=$(cat /etc/milq/server.env)

echo "node_meta{node_id=\"$NODE_ID\", container_label_com_docker_swarm_node_id=\"$NODE_ID\", node_name=\"$NODE_NAME\", env=\"$NODE_ENV\"} 1" > /etc/node-exporter/node-meta.prom

set -- /bin/node_exporter "$@"

exec "$@"
