#!/bin/bash

function export_proxy()
{
    export https_proxy=http://0.0.0.0:1087
    export all_proxy=http://0.0.0.0:1087
}

proxy_env = "https_proxy=http://0.0.0.0:1087 all_proxy=http://0.0.0.0:1087"
