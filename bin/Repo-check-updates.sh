#!/usr/bin/env bash

# description
# This script checks if a local repo and its remote are up to date with each
# other or not.  If they aren't then it tells the user what to do.  It accepts
# arguments for where the repo is and what branch to check
#
# Inputs:
#     1: -p (optional) The path to the git repo. Defaults to repo controlling the PWD
#     2: -b (optional) Which branch to check
# Output:
#    What the user should do to keep repos up to date

#set -x #echo all commands

# Colors for warning you
RED='\033[0;31m'
NC='\033[0m'  # No color

# Set GIT command
GIT_PATH=${1:-'@{u}'}
GIT="$(command -v git)"

# Get options
while getopts ":p:b:" opt; do
    case $opt in
        p)  # Set the path
            GIT="${GIT} -C ${OPTARG}"
            ;;
        b)  # Set the branch
            BRANCH=${OPTARG}
            ;;
        \?)
            echo "Invalid option: -${OPTARG}" >&2
            exit 1
            ;;
        :)
            echo "Option -${OPTARG} requires an argument." >&2
            exit 1
            ;;
    esac
done

# Update all branches without merging. Note that this line takes roughly 0.5
# seconds of the total execution time of about 0.7 seconds.
${GIT} remote update > /dev/null 2>&1

# Set our variables to check
UPSTREAM=${BRANCH:-'@{u}'}  # Optionally pass upstream branch explicitly
LOCAL="$(${GIT} rev-parse @)"
REMOTE="$(${GIT} rev-parse "$UPSTREAM")"
BASE="$(${GIT} merge-base @ "$UPSTREAM")"

# Now we actually do the checking
if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo -e "${RED}Need to pull${NC} "
elif [ $REMOTE = $BASE ]; then
    echo -e "${RED}Need to push${NC} "
else
    echo -e "${RED}Repo Has Diverged${NC} "
fi
