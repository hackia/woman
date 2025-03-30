# Bash completion for woman

_woman_completions()
{
    local cur prev opts actions tools
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    actions="--status --attach --test --audit --deps --perfs --doc --vcs --all --restart --stop --clean"
    tools="test clippy hack udeps audit deny outdated flamegraph doc fmt lazygit ungit"

    case "$prev" in
        --attach|--restart)
            COMPREPLY=( $(compgen -W "${tools}" -- "$cur") )
            return 0
            ;;
        *)
            COMPREPLY=( $(compgen -W "${actions}" -- "$cur") )
            return 0
            ;;
    esac
}

complete -F _woman_completions woman

