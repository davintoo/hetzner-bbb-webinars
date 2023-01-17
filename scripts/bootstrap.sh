#!/bin/bash
set -eu
BBB_DOMAIN=${BBB_DOMAIN:-}

waitforapt(){
  while fuser /var/lib/apt/lists/lock >/dev/null 2>&1 ; do
     echo "Waiting for other software managers to finish..." 
     sleep 1
  done
}

waitforapt
apt-get -qq update
DEBIAN_FRONTEND=noninteractive apt-get -qq upgrade -y -f
DEBIAN_FRONTEND=noninteractive apt-get -qq install -y \
    apt-transport-https \
    ca-certificates \
    wget \
    curl \
    language-pack-en \
    software-properties-common

update-locale LANG=en_US.UTF-8

chmod +x /root/bbb-install.sh
/root/bbb-install.sh -v focal-250 -s $BBB_DOMAIN -d

bbb-conf --status
bbb-conf --secret
