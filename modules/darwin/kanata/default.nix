{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.kanata
  ];

  # based on https://github.com/jtroo/kanata/discussions/1537
  launchd.daemons = {
    kanata.serviceConfig = {
      ProgramArguments = [
        "${pkgs.kanata}/bin/kanata"
        "-c"
        "${./caps2esc.kbd}"
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
}
