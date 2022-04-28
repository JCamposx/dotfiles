set fish_greeting ""

# Aliases
alias grep "grep --color=auto"
alias cat "bat --style=plain --paging=never"
alias ls "exa --group-directories-first"
alias la "exa --group-directories-first -a --long --header"
alias tree "exa -T"
alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias vim "nvim"
alias rm "rm -i"

# Prompt
starship init fish | source

# Env variables
export EDITOR=nvim
export BROWSER=chromium
