#!/bin/bash

cd `dirname $0`

git submodule update -i --recursive

for file in `ls -A | grep -v 'setup.sh$' | grep -v '.git$' | grep -v '.gitignore$' | grep -v '.gitmodules$'`; do
    if [ -h $HOME/$file ]; then
        rm $HOME/$file
    fi
    ln -s $PWD/$file $HOME/$file
done

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundle
rm installer.sh
