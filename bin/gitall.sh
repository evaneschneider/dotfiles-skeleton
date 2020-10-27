#!/usr/bin/env bash

# This script runs the same git command on many different repos.
# Primarily this is supposed to be used for pushing or pulling all the repos
# at once but could also be used for git status or any other command.


#this is the git command that will be executed, push, pull, status, etc
git_command=${1}

#new we declare and assign an array with all paths to the repos in it
if [[ "${HOSTNAME}" = "Capt-Janeway.local" ]] ; then
  repo_path=(
      '/Users/Bob/dotfiles'
      '/Users/Bob/Desktop/PhD-Research/cholla-Makefile'
      '/Users/Bob/Desktop/PhD-Research/cholla'
      '/Users/Bob/Desktop/PhD-Research/Hydro-Sandbox'
      '/Users/Bob/Documents/git-projects/bcaddy.github.io'
  )
elif [[ "${HOSTNAME}" = "Capt-Picard.local" ]] ; then
  repo_path=(
      '/Users/bob/dotfiles'
  )
elif [[ "${HOSTNAME}" = "login0.crc.pitt.edu" || "${HOSTNAME}" = "login1.crc.pitt.edu" ]] ; then
  repo_path=(
      '/ihome/eschneider/rvc9/dotfiles'
      '/ihome/eschneider/rvc9/Learning-Cpp-CUDA'
      '/ihome/eschneider/rvc9/cholla'
      '/ihome/eschneider/rvc9/cholla-Makefile'
      '/ihome/eschneider/rvc9/hydro-sandbox'
  )
else
  echo "Host not found. Exiting"
  break
fi

#define some colors so that I can have some echo's show color
NC='\033[0m' # No Color
HIGHLIGHT_COLOR='\033[0;33m'

# now loop over all the elements in the repo_path array and run the same git command with them
if [ "${git_command,,}" == "check" ]; then
    for path in "${repo_path[@]}"
    do
        echo -e "${HIGHLIGHT_COLOR} $path ${NC}"
        Repo-check-updates.sh -p "${path}"
        echo
    done
else
    for path in "${repo_path[@]}"
    do
        echo
        echo -e "${HIGHLIGHT_COLOR} $path ${NC}"
        git -C $path $git_command
        echo
    done
fi
