_woman()
{
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  opts="--status --attach --test --audit --deps --perfs --doc --vcs --restart --stop --clean --tmux --screen --broot --ranger --code"

  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}
complete -F _woman woman

