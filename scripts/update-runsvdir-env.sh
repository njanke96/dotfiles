#!/bin/sh

turnstile-update-runit-env \
  DBUS_SESSION_BUS_ADDRESS \
  DISPLAY \
  WAYLAND_DISPLAY \
  XDG_RUNTIME_DIR
