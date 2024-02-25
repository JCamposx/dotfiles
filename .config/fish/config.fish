# Aliases
alias grep "grep --color=auto"
alias cat "bat"
alias ls "exa --group-directories-first"
alias la "exa -a --group-directories-first --header --long"
alias tree "exa -T"
alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias vim "nvim"
alias rm "rm -i"
alias sail "[ -f sail ] && bash sail || bash vendor/bin/sail"
alias pvm "source $HOME/.local/bin/pvm"

# Prompt
starship init fish | source

# Transient prompt
function starship_transient_prompt_func
  echo \n
end

enable_transience

# Env variables
export EDITOR=nvim
export BROWSER=brave
export CLIPMAN_IMG=$HOME/.cache/xfce4/clipman/image0.png
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_DEFAULT_COMMAND="fd --type d --hidden"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND=$FZF_DEFAULT_COMMAND

export PATH="$PATH:$HOME/.composer/vendor/bin"

export ANDROID_HOME="$HOME/.config/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
