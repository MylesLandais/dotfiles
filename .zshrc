autoload -U colors && colors

PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%~ %{$reset_color%}%% "

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
