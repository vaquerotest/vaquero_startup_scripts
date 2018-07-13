#!/bin/bash
set -euo pipefail

docker run \
    --name agent-0 \
    -d \
    -v /opt/cisco/vamahali/vaquero/config/dir-sot-g1a-vasu_agent_server.yaml:/vaquero/config.yaml \
    -v /opt/cisco/vaquero/files:/var/vaquero/files \
    -v /opt/cisco/vaquero/pxeroms:/var/vaquero/pxeroms \
    -v /opt/cisco/vaquero/secret:/vaquero/secret \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /etc/localtime:/etc/localtime:ro \
    --net="host" \
    --privileged \
    -e VAQUERO_SHARED_SECRET="<secret>" \
    -e VAQUERO_SERVER_SECRET="<secret>" \
    -e VAQUERO_SITE_ID="site1" \
    -e VAQUERO_AGENT_ID="agent0" \
    vaquero-vasu \
        agent --config /vaquero/config.yaml --log-level debug
