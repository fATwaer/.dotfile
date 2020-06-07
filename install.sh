#! /bin/bash

DEBUG=1

DotfilePATH=~/.dotfile
# vimrc and bashrc
VimCachePath=~/.cache/vim
VimPlugPath=~/.vim/autoload

DIRTOCREATE=($DotfilePath $VimCachePath $VimPlugPath)

# rc files
rf_files=(~/.vim ~/.bashrc)

function dprint {
  if [[ ${DEBUG} -eq 1 ]]
  then
      echo $1
  fi
}

function create_directory {
    for path in ${DIRTOCREATE}
    do
        mkdir -p ${path}
    done
}

function create_rcfile_links {
  dprint $1
  echo "ready to create rc_file links ..."
  for rc_file in $1
  do
    unlink ${rc_file}
    ln -sf ${rc_file} ~
  done
}

function backup_origin_file {
  dprint $1
  backup_path=~/.backup
  echo "ready to backup original files..."
  mkdir -p ${backup_path}
  for rc_file in $1
  do
    cp -r ${rc_file} ${backup_path}
    echo "backup "${rc_file} to ${backup_path}
  done
  echo "backup done !!"
}

function exec_intall {
  create_directory
  backup_origin_file ${rf_files}
  create_rcfile_links ${rf_files}
}

exec_intall
