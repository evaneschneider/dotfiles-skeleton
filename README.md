# Dotfiles
This is a central repo for my dotfiles. It's designed to work on macOS Mojave
and newer and on linux supercomputing clusters. It's a work in progress, use at
your own risk. This version of the repo is just the skeleton, some basic scripts/settings,
and examples to get you started. Feel free to ask me questions.


## Dependencies:
* bash >= 5.x
* nano >= 4.6
* git >= 2.24
* ack >= 3.x
* GNU coreutils >= 8.31
* GNU `time`

## Summary
1. `bash_profile` just sources `bashrc`
2. `bashrc` contains all the sourcing statements
3. `bash_aliases.sh` contains all the global aliases
4. `bash_exports` contains all global variables and other export commands
5. `bash_functions` contains all bash functions
6. `<repo-root>/bin` contains all global scripts
7. each host needs a directory with the hostname as the directory name and then
  must contain the local `bashrc` file and all the local scripts in
  `<repo-root>/HOSTNAME/bin`
  - For long or unwieldy hostnames a remapping can be done in `bashrc`. See the
    example for the h2p cluster


## Setup Instructions
1. Make sure there is nothing in the original dotfiles that you want to keep
2. Check that ack, git, bash, and nano are all installed and of the appropriate
   version
   - If you are on macOS make sure to install GNU coreutils and GNU's
     implmentation of `time` then add the following to your path and manpath in
     your bashrc_exports file before running setup.sh
     - PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
     - MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
3. Create a directory for the new machine that is name like `<repo-root>/HOSTNAME`.
   If the hostname is complex or there are multiple log in nodes then you can
   remap them to a more human readable name in `bashrc`; see the example there for
   the h2p cluster.
4. Clone the repo, it must be in the home directory. If you want to put it
   elsewhere you must change the setup script, the bashrc file, and maybe others
5. Run `setup.sh` in `<repo-root>/bin`. This will add soft links to `bash_profile`,
   `bashrc`, `nanorc`, and `gitconfig` and will backup the old versions of those files
   to `~/.old-dotfiles-backup`
6. Install iTerm2 Shell Integration by copying appropriate files from a machine
   that has up to date versions of them


## Setup instructions/notes for other things
1. Setting up git
  1. When setting up ssh you have to use the `~/.ssh/config` file to tell ssh
     which key is for GitHub and which is for other things
