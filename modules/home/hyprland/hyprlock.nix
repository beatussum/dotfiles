{ inputs, ... }:
{
  flake.homeModules.hyprlock =
    { pkgs, ... }:
    {
      imports = [ inputs.catppuccin.homeModules.catppuccin ];

      home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
      stylix.targets.hyprlock.enable = false;
      catppuccin.hyprlock.enable = true;
      programs.hyprlock.enable = true;
    };
}
