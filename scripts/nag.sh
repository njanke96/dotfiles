#!/bin/bash

labnag -t 2 --layer overlay --background-color 282828ee --border-bottom-color d65d0e -m "$@" &
sleep 2

# timeout not working?
kill $!
