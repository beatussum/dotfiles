{
  flake.homeModules.hyprcursor =
    { lib, pkgs, ... }:
    {
      home.pointerCursor = {
        enable = true;
        name = lib.getName pkgs.rose-pine-hyprcursor;
        hyprcursor.enable = true;
        package = pkgs.rose-pine-hyprcursor;
      };
    };
}
