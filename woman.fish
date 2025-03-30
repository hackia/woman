# == Main actions ==
complete -c woman -n '__fish_use_subcommand' -a '--status'  -d "Show service status"
complete -c woman -n '__fish_use_subcommand' -a '--attach'  -d "Attach to a session"
complete -c woman -n '__fish_use_subcommand' -a '--test'    -d "Launch test tools"
complete -c woman -n '__fish_use_subcommand' -a '--audit'   -d "Launch security tools"
complete -c woman -n '__fish_use_subcommand' -a '--deps'    -d "Check dependencies"
complete -c woman -n '__fish_use_subcommand' -a '--perfs'   -d "Launch performance tools"
complete -c woman -n '__fish_use_subcommand' -a '--doc'     -d "Generate documentation"
complete -c woman -n '__fish_use_subcommand' -a '--vcs'     -d "Git/version control tools"
complete -c woman -n '__fish_use_subcommand' -a '--all'     -d "Launch all tools"
complete -c woman -n '__fish_use_subcommand' -a '--restart' -d "Restart a group"
complete -c woman -n '__fish_use_subcommand' -a '--stop'    -d "Stop all sessions"
complete -c woman -n '__fish_use_subcommand' -a '--clean'   -d "Clean ttyd and sessions"

# == Group suggestions after --restart ==
complete -c woman -n '__fish_seen_subcommand_from --restart' -a "test audit deps perfs doc vcs all" -d "Group to restart"

# == Services suggestions after --attach ==
complete -c woman -n '__fish_seen_subcommand_from --attach' -a "test clippy hack udeps audit deny outdated flamegraph doc fmt lazygit ungit" -d "Session name"

# == Backend options ==
complete -c woman -l tmux   -d "Use tmux as backend"
complete -c woman -l screen -d "Use screen as backend"

# == Editor options ==
complete -c woman -l broot  -d "Launch broot at the end"
complete -c woman -l ranger -d "Launch ranger at the end"
complete -c woman -l code   -d "Launch VS Code at the end"

