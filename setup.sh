#!/bin/bash

cd `dirname $0`

for file in `ls -A | grep -v 'setup.sh$' | grep -v '.git$' | grep -v '.gitignore$' | grep -v '.gitmodules$'`; do
    if [ -h $HOME/$file ]; then
        rm $HOME/$file
    fi
    ln -s $PWD/$file $HOME/$file
done
