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
module load cuda/10.1                   # Required to compile Cholla, must be loaded first
module load gcc/8.2.0                   # Prereq for python, perl, and HDF5

  # Personal environment modules
module load nano/4.6                    # Modern version of nano
module load git/2.9.5                   # Modern version of git
module load python/anaconda3.7-2019.03  # Python version I use. Requires GCC/8.2.0

  # Cholla required modules
module load openmpi/3.1.1               # MPI parallel compiler 
module load hdf5/1.10.2                 # Required for Cholla datasets. Requires GCC 8.2.0

##### Exports ##################################################################
export GPG_TTY=$(tty) #forces terminal usage instead of GUI among other things
