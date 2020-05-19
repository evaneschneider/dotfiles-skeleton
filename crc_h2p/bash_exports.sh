################################################################################
# This file contains all the bash exports and configurations that are specific
# to the CRC's H2p cluster
################################################################################

##### User specific environment and startup programs ###########################

  # Source global definitions. This allows access to the various python and perl
  # scripts written by the sys admins for making tasks easier
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

  # Set the prompt correctly.  This is required since $HOST just gives "loginX"
  # and I want host to be "h2p.loginX"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;35m\]h2p.\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\]\]$ '

##### Load modules #############################################################
  # Make sure there are no unexpected modules loaded
module purge

  # General use modules
module load ALL-REQUIRED-MODULES #FIXME

##### Exports ##################################################################
export GPG_TTY=$(tty) #forces terminal usage instead of GUI among other things
