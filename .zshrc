autoload -U colors && colors

PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%~ %{$reset_color%}%% "

## ~/.zsh_history
HISTFILE=~/.zsh_history
HISTSIZE=999999
SAVEHIST=999999
setops share_history

## CTRL-E to open command in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
## CRTL-Arrows, Jump by Word fix
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

## Fish-like completions
plugins=(
        history-substring-search
)

alias tf="terraform"

# ChooseNim Disable telemetry
# [https://github.com/dom96/choosenim/blob/master/analytics.md]
export DO_NOT_TRACK=1

# Import Path for nimble + choosenim
export PATH=/home/alexei/.nimble/bin:$PATH
