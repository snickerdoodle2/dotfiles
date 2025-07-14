{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options.layout = mkOption {
    type = types.enum ["ansi" "iso"];
    default = "ansi";
  };
  config = let
    config_file =
      if config.layout == "ansi"
      then ./caps2esc.kbd
      else ./caps2esc_iso.kbd;
  in {
    # based on https://github.com/jtroo/kanata/discussions/1537
    homebrew.brews = ["kanata"];

    launchd.daemons = {
      kanata.serviceConfig = {
        ProgramArguments = [
          "/opt/homebrew/bin/kanata"
          "-c"
          "${config_file}"
        ];
        RunAtLoad = true;
        KeepAlive = true;
        StandardOutPath = "/Library/Logs/Kanata/kanata.out.log";
        StandardErrorPath = "/Library/Logs/Kanata/kanata.err.log";
      };
      karabiner-vhiddaemon.serviceConfig = {
        ProgramArguments = [
          "/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon"
        ];
        RunAtLoad = true;
        KeepAlive = true;
      };
      karabiner-vhidmanager.serviceConfig = {
        ProgramArguments = [
          "/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager"
          "activate"
        ];
        RunAtLoad = true;
      };
    };
  };
}
