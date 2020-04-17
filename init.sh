#!/bin/bash

if [ -L "$HOME/.common_shell" ]; then
    exit
fi

ln -s "$(pwd)" "$HOME/.common_shell"
