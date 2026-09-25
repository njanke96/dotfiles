#!/bin/bash

sed '/end-cheatsheet/q; s/^#[[:space:]]*//' ~/.config/sway/config | bat --paging always --file-name Help
