#!/bin/bash

SAII="sway-audio-idle-inhibit"

# shellcheck disable=SC2086

# --- Signal Handler ---
cleanup() {
    echo "Caught signal. Shutting down SAII (PID: $SAII_PID) and cleaning up..."
    if [ ! -z "$SAII_PID" ] && kill -0 $SAII_PID 2>/dev/null; then
        kill $SAII_PID
    fi

    # idk
    pgrep -i -f sway-audio-idle-inhibit | xargs kill

    exit 0
}

# Trap common termination signals
trap cleanup SIGINT SIGTERM SIGHUP

# shellcheck disable=SC2086

# --- Main Loop ---
echo "Starting SAII watcher script. PID: $$"
while true; do
    echo "-----------------------------------"
    echo "Launching SAII..."

    sh -c "$SAII" &
    SAII_PID=$! # Capture the PID of the SAII process

    echo "SAII started with PID: $SAII_PID"

    # 3. Wait for SAII to exit (either naturally, by crash, or forced by the watcher)
    wait $SAII_PID
    EXIT_STATUS=$?

    echo "SAII (PID: $SAII_PID) exited with status $EXIT_STATUS."

    # Add a short delay to prevent thrashing
    sleep 2

done

cleanup
