@_default:
    just --list

command := if os() == "linux" { "sudo nixos-rebuild switch --flake ." } else { "@echo UNKNOWN OS" }

deploy:
    {{command}}

rollback:
    {{command}} --rollback

check:
    nix flake check

format:
    nix fmt .
