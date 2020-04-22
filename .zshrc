autoload -U colors && colors

PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%~ %{$reset_color%}%% "

## CTRL-E to open command in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

## Fish-like completions
plugins=(
        history-substring-search
)
