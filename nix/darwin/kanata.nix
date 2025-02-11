config-path: {
  environment.etc."keyboard.kbd" = {
    enable = true;
    source = config-path;
  };

  launchd.user.agents.karabiner = {
    command = "sudo '/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon'";
    serviceConfig = {
      UserName = "domi";
      RunAtLoad = true;
      KeepAlive = {
        SuccessfulExit = false;
        Crashed = true;
      };
      StandardErrorPath = "/Users/domi/.logs/karabiner.err.log";
      StandardOutPath = "/Users/domi/.logs/karabiner.out.log";
      ProcessType = "Interactive";
      Nice = -30;
    };
  };

  launchd.user.agents.kanata = {
    command = "sudo /opt/homebrew/bin/kanata --cfg /etc/keyboard.kbd -n";
    serviceConfig = {
      UserName = "domi";
      RunAtLoad = true;
      KeepAlive = {
        SuccessfulExit = false;
        Crashed = true;
      };
      StandardErrorPath = "/Users/domi/.logs/kanata.err.log";
      StandardOutPath = "/Users/domi/.logs/kanata.out.log";
      ProcessType = "Interactive";
      Nice = -30;
    };
  };

  security.sudo.extraConfig = ''
    %admin ALL=(root) NOPASSWD: /opt/homebrew/kanata --cfg /etc/keyboard.kbd
  '';
}
