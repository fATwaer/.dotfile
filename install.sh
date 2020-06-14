#! /bin/bash

set -o errexit

DEBUG=1

DotfilePath=~/.dotfile
# vimrc
VimCachePath=~/.cache/vim
VimPlugPath=~/.vim/autoload

DIRTOCREATE=($DotfilePath $VimCachePath $VimPlugPath)

# settings files
target_path=(~/.vim ~/.bashrc)
origin_path=(.vim .bashrc)

function dprint {
  if [[ ${DEBUG} -eq 1 ]]
  then
      echo "$1"
  fi
}

function create_directory {
    for path in ${DIRTOCREATE[@]}
    do
        mkdir -p ${path}
    done
}

function create_rcfile_links {
  dprint $1
  echo "ready to create dotfiles links ..."
  for ((idx=0; idx<${#origin_path[@]}; idx++))
  do
      rm -r ${target_path[${idx}]}
      ln -sf ${DotfilePath}/${origin_path[${idx}]} ${target_path[${idx}]}
  done
}

function backup_origin_file {
  backup_path=./backup
  echo "ready to backup original files..."
  mkdir -p ${backup_path}
  for rc_file in "$@"
  do
    cp -r ${rc_file} ${backup_path}
    echo "backup "${rc_file} to ${backup_path}
  done
  echo "backup done !!"
}

function curl_download {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
}

function exec_intall {
  create_directory
  backup_origin_file "${target_path[@]}"
  create_rcfile_links
  curl_download
}

###
# execution
###

pushd ${DotfilePath}
exec_intall
popd ${DotfilePath}
