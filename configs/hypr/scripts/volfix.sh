#!/bin/bash

while sleep 0.1; do pactl set-source-volume @DEFAULT_SOURCE@ 80000; done

