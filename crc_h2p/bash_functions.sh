################################################################################
# This file contains all the bash functions that are specific to the CRC's H2p
# cluster
################################################################################

################################################################################
gpu () {
    # Starts an interactive job on the GPU cluster.  
    
    (set -x; crc-interactive.py --gpu --partition=gtx1080 --time=1 --num-gpus=${1})

}
################################################################################
