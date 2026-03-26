{
  flake.homeModules.helix =
    { pkgs, ... }:
    {
      programs.helix = {
        defaultEditor = true;
        enable = true;
        settings.editor.soft-wrap.enable = true;

        languages = {
          language-server.rust-analyzer.config.check.command = "${pkgs.clippy}/bin/clippy";

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
