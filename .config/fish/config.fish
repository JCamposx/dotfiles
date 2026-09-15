# Fish behavior
set -g fish_greeting
set -g fish_color_command green
set -g fish_pager_color_progress black --background=cyan
set -g fish_transient_prompt 1

# Vi mode
fish_vi_key_bindings

# Key bindings
bind -M default alt-v true
bind -M insert alt-v true
bind -M visual alt-v true

# Editor
set -gx EDITOR nvim

# XDG base directories
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

# Path handling
fish_add_path $HOME/.local/bin
fish_add_path /opt/homebrew/bin/
set -gx GOPATH $HOME/.go
fish_add_path $GOPATH/bin
