#!/usr/bin/env bash

###################################################################
# Constants
###################################################################

APPTAINER_VERSION=1.1.6

###################################################################
# Main
###################################################################

sudo apt update
sudo apt install -y wget

cd /tmp && \
    wget https://github.com/apptainer/apptainer/releases/download/v${APPTAINER_VERSION}/apptainer_${APPTAINER_VERSION}_amd64.deb && \
    sudo apt install -y ./apptainer_${APPTAINER_VERSION}_amd64.deb && \
    wget https://github.com/apptainer/apptainer/releases/download/v${APPTAINER_VERSION}/apptainer-suid_${APPTAINER_VERSION}_amd64.deb && \
    sudo dpkg -i ./apptainer-suid_${APPTAINER_VERSION}_amd64.deb
    
cd /tmp && \
    apptainer pull docker://ghcr.io/apptainer/lolcow && \ 
    apptainer exec lolcow_latest.sif cowsay moo
    
