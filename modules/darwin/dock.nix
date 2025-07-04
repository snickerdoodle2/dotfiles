{config, ...}: {
  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.1;
    launchanim = false;
    magnification = false;
    mineffect = "scale";
    show-recents = false;
    static-only = false;
    tilesize = 32;

    # 1 - disabled
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
    wvous-tl-corner = 1;
    wvous-tr-corner = 1;

    persistent-apps = [
      {
        app = "/Applications/Zen.app";
      }
      {
        spacer = {
          small = true;
        };
      }
    ];
    persistent-others = [
      "${config.users.users.domi.home}/Documents"
      "${config.users.users.domi.home}/Downloads"
    ];
  };
}
