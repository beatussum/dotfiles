{
  flake.homeModules.helix =
    { lib, pkgs, ... }:
    {
      programs.helix = {
        defaultEditor = true;
        enable = true;
        settings.editor.soft-wrap.enable = true;

        languages = {
          language-server.rust-analyzer.config.check.command = lib.getExe pkgs.clippy;

          language = [
            {
              name = "nix";
              auto-format = true;
            }
          ];
        };
      };
    };
}
