{system, ...}: {
    inherit system;
    imports = [
        ../common
    ];
    nixpkgs.hostPlatform = "aarch64-darwin";
}