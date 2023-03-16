#!/usr/bin/env bash

###################################################################
# Constants
###################################################################

GO_FILE=go1.13.linux-amd64.tar.gz
SINGULARITY_FILE=singularity-3.5.3.tar.gz

###################################################################
# Main
###################################################################

sudo apt-get update

sudo apt-get install -y build-essential libssl-dev uuid-dev libgpgme11-dev \
    squashfs-tools libseccomp-dev wget pkg-config git cryptsetup debootstrap

sudo yum -y update 

sudo yum -y groupinstall 'Development Tools'

sudo yum -y install wget epel-release

sudo yum -y install debootstrap.noarch squashfs-tools openssl-devel \
    libuuid-devel gpgme-devel libseccomp-devel cryptsetup-luks

wget "https://dl.google.com/go/${GO_FILE}"

sudo tar --directory=/usr/local -xzvf $GO_FILE
export PATH=/usr/local/go/bin:$PATH

wget https://github.com/singularityware/singularity/releases/download/v3.5.3/${SINGULARITY_FILE}

tar -xzvf "$SINGULARITY_FILE"

cd singularity && \
    ./mconfig && \
    cd ./builddir && \
    make && \
    sudo make install && \
    . ./etc/bash_completion.d/singularity && \
    sudo mkdir -p /etc/bash_completion.d/ && \
    sudo cp ./etc/bash_completion.d/singularity /etc/bash_completion.d/

singularity run library://godlovedc/funny/lolcow