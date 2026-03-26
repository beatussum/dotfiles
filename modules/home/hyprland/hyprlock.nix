{ inputs, ... }:
{
  flake.homeModules.hyprlock = {
    imports = [ inputs.catppuccin.homeModules.catppuccin ];

    stylix.targets.hyprlock.enable = false;
    catppuccin.hyprlock.enable = true;
    programs.hyprlock.enable = true;
  };
}
