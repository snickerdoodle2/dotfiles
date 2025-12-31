@_default:
    just --list

command := if os() == "linux" { "sudo nixos-rebuild switch --flake ." } else { "@echo UNKNOWN OS" }

deploy:
    {{command}}

check:
    nix flake check
