#!/bin/bash
set -euo pipefail
#rm -rf /opt/vaquero/vamahali/vaquero/savepath
#mkdir  -p /opt/vaquero/vamahali/vaquero/savepath
#rm -rf ./logs
docker run \
    --name server \
    -d \
    -v /opt/cisco/vamahali/vaquero/config/dir-sot-g1a-vasu.yaml:/vaquero/config.yaml \
    -v /opt/cisco/vamahali/vaquero/files:/var/vaquero/files \
    -v /opt/cisco/vamahali/vaquero/pxeroms:/var/vaquero/pxeroms \
    -v /opt/cisco/vamahali/vaquero/secret:/vaquero/secret \
    -v /opt/cisco/vamahali/vaquero/savepath:/var/vaquero \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /etc/localtime:/etc/localtime:ro \
    --net="host" \
    --privileged \
    -e VAQUERO_SHARED_SECRET="<secret>" \
    -e VAQUERO_SERVER_SECRET="<secret>" \
    -e VAQUERO_SITE_ID="site1" \
    -e VAQUERO_AGENT_ID="agent0" \
    vaquero-vasu \
        standalone --config /vaquero/config.yaml --log-level debug
