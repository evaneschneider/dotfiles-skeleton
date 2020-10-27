#!/usr/bin/env bash

# Call GDB with appropriate PYTHON environment variables set. Also, pass all
# arguments given to this script to gdb

#set -x #echo all commands
PYTHON_LIBRARY=/usr/lib64/python2.7 PYTHONPATH=/usr/lib64/python2.7:/usr/lib64/python2.7/lib-dynload:/usr/lib64/python2.7/site-packages gdb "$@"
