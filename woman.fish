complete -c woman -f

set -l action init run status restart attach list
set -l language rust c d cpp go java kotlin swift typescript javascript python ruby php csharp scala dart objective-c perl bash powershell lua zig nim crystal elixir gleam vale carbon vlang bun scratch logo pascal scheme racket alice processing r julia matlab octave verilog vhdl systemverilog glsl hlsl wgsl metal sql cypher graphql promql influxql coq agda lean isabelle terraform hcl puppet ansible nix html css sass less markdown scss fortran cobol lisp smalltalk ada basic ml ocaml modula-2 delphi brainfuck whitespace malbolge piet wasm asm llvm makefile dockerfile yaml toml ini json csv fish zsh sh awk sed gml godotscript haxe unrealscript tex latex postscript lilypond plantuml
set -l backend tmux screen

complete -c woman -n "not __fish_seen_subcommand_from init" -a "$language" -d 'init the repo'
complete -c woman -s b -l backend --no-files -ra "$backend" -d "The backend to use"
complete -c woman -s a -l action --no-files -ra "$action" -d "The action to run"
complete -c woman -n "not __fish_seen_subcommand_from status" -d 'Get woman status'
