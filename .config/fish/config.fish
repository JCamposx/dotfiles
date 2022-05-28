set fish_greeting ""

# Aliases
alias grep "grep --color=auto"
alias cat "bat --style=plain --paging=never"
alias ls "exa --group-directories-first"
alias la "exa -a --group-directories-first --long"
alias tree "exa -T"
alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias vim "nvim"
alias rm "rm -i"

# Prompt
starship init fish | source

# Env variables
export EDITOR=nvim
export BROWSER=chromium
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
