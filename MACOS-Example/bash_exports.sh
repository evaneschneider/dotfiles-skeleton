################################################################################
# This file contains all the bash exports and configurations that are specific
# to Janeway
################################################################################


##### User specific environment and startup programs ###########################
  # Add GNU coreutils to path
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  # Add GNU coreutils to man path
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

  # All the stuff required for conda/anaconda to work
  # !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false "${HOME}/opt/anaconda3/bin/conda" shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "${HOME}/opt/anaconda3/etc/profile.d/conda.sh" ]; then
  # . "/Users/Bob/opt/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="${HOME}/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
  # End Conda setup

  # Source git autocompletion
source /usr/local/etc/bash_completion.d/git-completion.bash

  # Reset the command prompt since the conda init messes it up
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\]\$ '

##### Exports ##################################################################
  # Setup GPG
export GPG_TTY=$(tty) #forces terminal usage instead of GUI among other things
