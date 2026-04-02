{
  flake.homeModules.caelestia = {
    services.cliphist.enable = true;

    programs.caelestia = {
      enable = true;

      cli.enable = true;
    };
  };
}
