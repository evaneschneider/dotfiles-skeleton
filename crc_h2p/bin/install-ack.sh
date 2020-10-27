#!/usr/bin/env bash

# This script prompts the user to check for an updated
# version of ack then installs ack if prompted.

#set -x #echo all commands
ack_path="${HOME}/dotfiles/crc_h2p/bin/ack"
ack_version="v3.4.0"
ack_install="curl https://beyondgrep.com/ack-${ack_version} > ${ack_path} && chmod 0755 ${ack_path}"

echo -n "This will install ack ${ack_version}, please check for updates at 'https://beyondgrep.com/install/'."

while true; do
    echo ''
    read -p "Would you like to proceed? (y,n) " yn
    case ${yn} in
        [Yy]* ) echo "Installing ack with: ${ack_install}"  ; eval ${ack_install}; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
