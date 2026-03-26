{
  flake.homeModules.keepassxc = {
    programs.keepassxc = {
      autostart = true;
      enable = true;
    };
  };
}
