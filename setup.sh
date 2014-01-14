#!/bin/bash

cd `dirname $0`

for file in `ls -A | grep -v 'setup.sh$' | grep -v '.git$' | grep -v '.gitmodules$'`; do
    ln -s $PWD/$file $HOME/$file
done
