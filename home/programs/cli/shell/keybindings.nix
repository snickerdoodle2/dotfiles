{...}: {
  programs.nushell.settings.keybindings = [
    {
      name = "edit_command";
      modifier = "control_alt";
      keycode = "char_x";
      mode = "emacs";
      event.send = "OpenEditor";
    }
    {
      name = "move_word_backwards";
      modifier = "control";
      keycode = "char_j";
      mode = "emacs";
      event.edit = "MoveWordLeft";
    }
    {
      name = "move_word_forwards";
      modifier = "control";
      keycode = "char_k";
      mode = "emacs";
      event.edit = "MoveWordRight";
    }
  ];
}
