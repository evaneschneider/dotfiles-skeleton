#!/usr/bin/env bash
set -e #set bash to exit if an error pops up

# Initialize variables, AKA gibberish
backup_location="${HOME}/.old-dotfiles-backup"
declare -A dotfiles_to_link

# Setup script to link relevant files from the dotfile-skeleton repo to your
# home directory.
# NOTE: This will backup and overwrite your files
echo "Any overwritten file will be backed up to ${backup_location}"
read -p "This will overwrite files in your home directory, continue? (y,n) " confirm
if [[ ! "$confirm" =~ ^[yY]$ ]] ; then
  echo "Halting setup process, no files have been overwritten"
  exit 2
fi

# Create backup directory if it doesn't exist
mkdir -p "$backup_location"

# Map of dotfiles to link to the home directory. The map key is dotfiles
# relative to the repo directory, and map value is the home directory location
# the file will be linked to, relative to the home directory.
# YOU CAN MODIFY THIS LIST
dotfiles_to_link["bash_profile.sh"]=".bash_profile"
dotfiles_to_link["bashrc.sh"]=".bashrc"
dotfiles_to_link["vimrc"]=".vimrc"
dotfiles_to_link["gitconfig"]=".gitconfig"
dotfiles_to_link["pythonrc.py"]=".pythonrc"
dotfiles_to_link["inputrc.sh"]=".inputrc"

# DO NOT MODIFY, aka important gibberish
for dotfile in "${!dotfiles_to_link[@]}" ; do
  link_file="${dotfiles_to_link[$dotfile]}"
  if [ -f "${HOME}/dotfiles/${dotfile}" ] ; then
    if [ -f "${HOME}/${link_file}" ] ; then
      echo "Moving ${HOME}/${link_file} to ${backup_location}/${link_file}.$(date -Iminutes)"
      mv "${HOME}/$link_file" "${backup_location}/${link_file}.$(date -Iminutes)"
    elif [ -e "${HOME}/${link_file}" ] ; then
      echo "Removing ${HOME}/${link_file}"
      rm -rf "${HOME}/${link_file}"
    fi
    echo "Linking ${HOME}/dotfiles/${dotfile} to ${HOME}/${link_file}"
    ln -s "${HOME}/dotfiles/${dotfile}" "${HOME}/${link_file}"
  else
    echo "Cannot find the file ${dotfile} in the repo path ${HOME}/dotfiles, skipping"
  fi
done

# Create trash directory
if [ ! -d "${HOME}/.Trash" ]
then
  mkdir ${HOME}/.Trash
fi
