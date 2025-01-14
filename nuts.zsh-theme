function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "%{$fg[blue]%}($(parse_git_dirty)${ref#refs/heads/}%{$fg[blue]%})"
  fi
}

function shouldDisplayZeroPrefix() {
  hour=$(date +%H)
  if [[ "$(echo $hour | head -c 1)" == "0" ]]; then
    echo "0"
  fi
}

PROMPT='%{$fg_bold[cyan]%}%c$(git_prompt_info)%(?:%{$fg_bold[white]%}:%{$fg_bold[red]%}) ▶%{$reset_color%} '
RPROMPT='$(shouldDisplayZeroPrefix)%{$fg[white]%}%*%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
