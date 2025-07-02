{pkgs, ...}: {
  programs.lazydocker = {
    enable = true;
    package = pkgs.lazydocker;
    settings = {
      gui = {
        border = "single";
        returnImmediately = true;
        sidePanelWidth = 0.2;
        theme = {
          activeBorderColor = [
            "#cba6f7"
            "bold"
          ];
          inactiveBorderColor = [
            "#a6adc8"
          ];
          optionsTextColor = [
            "#89b4fa"
          ];
          selectedLineBgColor = [
            "#313244"
          ];
        };
      };
    };
  };
}
