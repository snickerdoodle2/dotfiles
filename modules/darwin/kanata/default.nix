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
        "--debug"
      ];
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/Library/Logs/Kanata/kanata.out.log";
      StandardErrorPath = "/Library/Logs/Kanata/kanata.err.log";
    };
  };
}
