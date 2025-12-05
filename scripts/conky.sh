#!/bin/bash

# Define the Conky command and configuration file (adjust -c as needed)
CONKY_CMD="/home/nathan/AppImages/conky-ubuntu-24.04-x86_64-v1.22.2.AppImage"

# shellcheck disable=SC2086

# --- Signal Handler ---
cleanup() {
    echo "Caught signal. Shutting down Conky (PID: $CONKY_PID) and cleaning up..."
    # 1. Kill the Conky process
    if [ ! -z "$CONKY_PID" ] && kill -0 $CONKY_PID 2>/dev/null; then
        kill $CONKY_PID
    fi

    # kill the actual conky process
    pgrep -f conky-ubuntu | xargs kill

    exit 0
}

# Trap common termination signals
trap cleanup SIGINT SIGTERM SIGHUP

# shellcheck disable=SC2086

# --- Main Loop ---
echo "Starting Conky watcher script. PID: $$"
while true; do
    echo "-----------------------------------"
    echo "Launching Conky..."

    # 2. Execute Conky, redirecting its stdout to the FIFO pipe
    # Note: Use 'exec' or 'sh -c' to ensure proper redirection of background process
    sh -c "$CONKY_CMD" &
    CONKY_PID=$! # Capture the PID of the Conky process

    echo "Conky started with PID: $CONKY_PID"

    # 3. Wait for Conky to exit (either naturally, by crash, or forced by the watcher)
    wait $CONKY_PID
    EXIT_STATUS=$?

    echo "Conky (PID: $CONKY_PID) exited with status $EXIT_STATUS."

    # Add a short delay to prevent thrashing
    sleep 2

done

cleanup
