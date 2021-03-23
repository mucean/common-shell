#!/bin/bash

function os_version()
{
    # https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script
    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        # shellcheck source=/dev/null
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        OS=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        # shellcheck source=/dev/null
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        # Older Debian/Ubuntu/etc.
        OS=Debian
        VER=$(cat /etc/debian_version)
    else
        # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
        OS=$(uname -s)
        VER=$(uname -r)
    fi
    echo "OS=\"$OS\""
    echo "OS_VER=\"$VER\""
}

eval "$(os_version)"

function is_macos()
{
    [[ $(tr "[:lower:]" "[:upper:]" <<< "$OS") =~ "DARWIN" ]]
}

function is_arch()
{
    [[ $(tr "[:lower:]" "[:upper:]" <<< "$OS") =~ "ARCH" ]]
}
