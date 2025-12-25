starship init fish | source

function starship_transient_prompt_func
  echo ""
  starship module character
end

enable_transience
