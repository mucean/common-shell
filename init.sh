#!/bin/bash

if [ -L "$HOME/.common-shell" ]; then
    exit
fi

ln -s "$(pwd)" "$HOME/.common-shell"
