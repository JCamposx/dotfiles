# Aliases
alias grep "grep --color=auto"
alias cat "bat"
alias ls "eza --group-directories-first"
alias la "eza -a --group-directories-first --header --long"
alias tree "eza -T"
alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias rm "rm -i"
alias clear "printf '\033c'"

# Prompt
starship init fish | source

# Transient prompt
function starship_transient_prompt_func
  echo ""
  starship module character
end

enable_transience

# Env variables
export CLIPMAN_IMG=$HOME/.cache/xfce4/clipman/image0.png
export FZF_DEFAULT_OPTS="--height 40% --layout reverse --border"
export FZF_DEFAULT_COMMAND="fd --type f --hidden"
export FZF_CTRL_T_COMMAND="fd --type f --hidden"
export FZF_CTRL_T_OPTS="--preview 'bat --color always {}' --bind 'enter:execute(nvim {})+abort'"
export FZF_ALT_C_COMMAND="fd --type d --hidden"
export FZF_ALT_C_OPTS="--preview 'eza --color always -T {}'"
