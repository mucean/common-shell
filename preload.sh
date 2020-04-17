#!/bin/bash

# shellcheck source=/dev/null
source "$HOME/.common-shell/os.sh"

cmd_exist() {
    path="$(type -p "$1")" && [ -x "$path" ]
}

cmds_exist() {
    status=0
    for cmd in "$@"
    do
        if ! cmd_exist "$cmd"; then
            status=1
            echo "$cmd"
        fi
    done
    return $status
}

function cmds_exist_prompt() {
    if ! cmds="$(cmds_exist "$@")"; then
        echo "below commands not found: "
        echo "$cmds"
        return 1
    fi
    return 0
}

function sudo_passwd() {
    read -s -r -p "Enter Password for sudo: " sudo_pw
    echo "$sudo_pw"
}

