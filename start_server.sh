#!/bin/bash
set -euo pipefail

docker run \
    --name server \
    -d \
    -v /opt/cisco/vamahali/vaquero/config/dir-sot-g1a-vasu_agent_server.yaml:/vaquero/config.yaml \
    -v /opt/cisco/vaquero/files:/var/vaquero/files \
    -v /opt/cisco/vaquero/pxeroms:/var/vaquero/pxeroms \
    -v /opt/cisco/vaquero/secret:/vaquero/secret \
    -v /opt/cisco/vamahali/vaquero/savepath:/var/vaquero \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /etc/localtime:/etc/localtime:ro \
    --net="host" \
    --privileged \
    -e VAQUERO_SHARED_SECRET="<secret>" \
    -e VAQUERO_SERVER_SECRET="<secret>" \
    vaquero-vasu \
        server --config /vaquero/config.yaml --log-level debug
