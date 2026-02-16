set _fzf_fd_base "fd --hidden --exclude .git --exclude node_modules"

set -gx FZF_DEFAULT_COMMAND "$_fzf_fd_base"
set -gx FZF_DEFAULT_OPTS "--height 50% --layout reverse --border"
set -gx FZF_CTRL_T_COMMAND "$_fzf_fd_base --type f"
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color always {}' --bind 'enter:execute(nvim {})+abort'"
set -gx FZF_ALT_C_COMMAND "$_fzf_fd_base --type d"
set -gx FZF_ALT_C_OPTS "--preview 'eza --color always -T {}'"

fzf --fish | source
