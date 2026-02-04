@_default:
    just --list

[linux]
[group: "deployment"]
deploy:
    sudo nixos-rebuild switch --flake .

[linux]
[group: "deployment"]
[confirm]
rollback:
    sudo nixos-rebuild switch --flake . --rollback

[group: "utils"]
check:
    nix flake check

[group: "utils"]
format:
    nix fmt .

[group: "utils"]
prefetch url:
    nix develop -c nurl {{url}}
