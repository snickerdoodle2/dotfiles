{pkgs, ...}: {
  # TODO: customize chromium here
  programs.chromium = {
    enable = true;
    package =
      pkgs.chromium.override {enableWideVine = true;};
    commandLineArgs = [
      "--allowlisted-extension-id=clngdbkpkpeebahjckkjfobafhncgmne"
    ];
  };
}
