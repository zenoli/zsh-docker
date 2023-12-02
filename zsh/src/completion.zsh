function() {

    local completion_dir="$XDG_DATA_HOME/zsh/completion"

    [[ -d "$completion_dir" ]] || mkdir -p "$completion_dir"
    fpath+="$completion_dir"

    cmd_exists gh \
        && [[ ! -f $completion_dir/_gh ]] \
        && gh completion -s zsh > $completion_dir/_gh

    local zsh_cache_dir="$XDG_CACHE_HOME/zsh"
    if [[ ! -d $zsh_cache_dir ]]; then
        echo "Creating $zsh_cache_dir"
        mkdir -p $zsh_cache_dir
    fi
    local zshcompdump="$zsh_cache_dir/zcompdump"

    autoload -Uz compinit

    # cache .zcompdump for about a day
    if [[ $zshcompdump(#qNmh-20) ]]; then
        compinit -C -d "$zshcompdump"
    else
        compinit -i -d "$zshcompdump"; touch "$zshcompdump"
    fi
    {
        # compile .zcompdump
        if [[ -s "$zshcompdump" && (! -s "${zshcompdump}.zwc" || "$zshcompdump" -nt "${zshcompdump}.zwc") ]]; then
            zcompile "$zshcompdump"
        fi
    } &!
}
