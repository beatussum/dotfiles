{
  flake.homeModules.helix =
    { pkgs, ... }:
    {
      programs.helix = {
        defaultEditor = true;
        enable = true;
        languages.language-server.rust-analyzer.config.check.command = "${pkgs.clippy}/bin/clippy";
        settings.editor.soft-wrap.enable = true;
      };
    };
}
