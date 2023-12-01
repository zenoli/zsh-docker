function() {
    local zsh_state_dir=$(dirname $HISTFILE)
    if [[ ! -d $zsh_state_dir ]]; then
        echo "Creating $zsh_state_dir"
        mkdir -p $zsh_state_dir
    fi
}
