{
  flake.homeModules.stylix =
    { pkgs, ... }:
    {
      gtk.gtk4.theme = null;
      stylix.enable = true;
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    };
}
