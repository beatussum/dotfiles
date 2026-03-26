{
  flake.homeModules.helix =
    { pkgs, ... }:
    {
      programs.helix = {
        defaultEditor = true;
        enable = true;
        languages.language-server.rust-analyzer.config.check.command = pkgs.clippy;

        settings = {
          theme = "dark_plus";
          editor.soft-wrap.enable = true;
        };
      };
    };
}
