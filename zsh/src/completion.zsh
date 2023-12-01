ZSH_COMPLETION_DIR="$XDG_DATA_HOME/zsh/completion"

[[ -d "$ZSH_COMPLETION_DIR" ]] || mkdir -p "$ZSH_COMPLETION_DIR"
fpath+="$ZSH_COMPLETION_DIR"

# cmd_exists gh \
#     && [[ ! -f $completion_dir/_gh ]] 
#     && gh completion -s zsh > ~/.local/share/zsh/completion/_gh

autoload -Uz compinit
compinit -i

