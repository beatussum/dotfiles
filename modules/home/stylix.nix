{
  flake.homeModules.stylix =
    { pkgs, ... }:
    {
      stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

        targets = {
          gnome.enable = false;
          kde.enable = false;
        };
      };
    };
}
