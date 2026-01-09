{...}: {
  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = true;
    settings.style = {
      command_name.foreground = "red";
      example_variable.foreground = "white";
      example_code.foreground = "blue";
      example_text.foreground = "green";
    };
  };
}
