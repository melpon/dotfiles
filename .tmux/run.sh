#!/bin/sh

if which reattach-to-user-namespace; then
  reattach-to-user-namespace -l $SHELL
else
  exec $SHELL --login
fi
