# Rust Dev Environment with Live Monitoring via TTYD

**woman** is a lightweight command-line tool that launches a full Rust development environment using `tmux` or `screen`, with live monitoring in your browser via [ttyd](https://github.com/tsl0922/ttyd).

It manages multiple isolated dev sessions, each mapped to a useful cargo command (clippy, fmt, test, flamegraph…), with web access and real-time feedback.


## Features

- Auto-reloading dev tools with `cargo-watch`
- Built-in support for:
  - `clippy`, `fmt`, `test`, `hack`, `udeps`, `audit`, `deny`, `outdated`, `flamegraph`, `doc`, `ungit`, `lazygit`
- Web monitoring for each tool via `ttyd` (one URL per service)
- Smart `--status` report with uptime + backend
- Modular: use `screen` or `tmux`
- Shell completions for `bash`, `zsh`, `fish`
- AUR-ready with clean `Makefile` and `PKGBUILD`
- Includes a `man` page (`man woman`)

## Quick Start

```bash
sudo pacman -S bash screen tmux ttyd cargo-watch cargo-audit cargo-deny cargo-hack cargo-udeps lazygit 
```

[![AUR](https://img.shields.io/aur/version/woman)](https://aur.archlinux.org/packages/woman)

## Usage

```bash
woman --status             # Show all services
woman --test               # Launch test group (clippy, hack, udeps)
woman --audit              # Launch audit group (audit, deny)
woman --vcs                # Start VCS tools (lazygit, ungit)
woman --all                # Launch all sessions

woman --attach test        # Attach to the 'test' session
woman --restart test       # Restart just the test group
woman --stop               # Stop all sessions
woman --clean              # Stop all + kill web processes

# Use tmux or screen backend
woman --all --tmux
woman --vcs --screen
```

Access any tool via web browser (local only):

```txt
http://localhost:1939     → cargo doc
http://localhost:1618     → cargo test
http://localhost:1989     → ungit
```

## Completion Support

```bash
# bash: auto-installed to /usr/share/bash-completion/completions/woman
# fish: auto-installed if available
# zsh: auto-installed if available
```

Try typing:

```bash
woman --<TAB>
```

## Uninstall

```bash
sudo make uninstall
```

Removes binary + shell completions.

## Man Page

```bash
man woman
```

## Development

```bash
make check

makepkg -si
```

## Credits

Made with ❤️ by [@hackia](https://github.com/hackia)

## License

GPLv3
