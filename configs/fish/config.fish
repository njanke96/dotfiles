if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_prompt_pwd_dir_length 0
set -gx DWMQTT_USERNAME Dworx_MQTT
set -gx DWMQTT_PASSWORD X0Ij60y3dP9j
set -gx PATH "/home/nathan/.local/bin" $PATH

function fish_greeting
    echo "$(whoami)@$hostname"
    date
end

# pnpm
set -gx PNPM_HOME "/home/nathan/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
