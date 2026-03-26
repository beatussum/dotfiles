{
  flake.homeModules.hyprcursor =
    { pkgs, ... }:
    {
      home.pointerCursor = {
        enable = true;
        name = pkgs.rose-pine-hyprcursor.pname;
        hyprcursor.enable = true;
        package = pkgs.rose-pine-hyprcursor;
      };
    };
}
