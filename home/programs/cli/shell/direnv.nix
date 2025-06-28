{
  config,
  pkgs,
  ...
}: {
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };

    config = {
      global = {
        load_dotenv = true;
      };
    };
    silent = true;
  };

  programs.nushell.extraConfig = ''
    $env.config.hooks.env_change.PWD = [
        { ||
            direnv export json | from json | default {} | load-env
            $env.PATH = $env.PATH | split row (char env_sep)
        }
    ];
  '';
}
