{
  flake.homeModules.nushell =
    { pkgs, ... }:
    {
      home.shell.enableNushellIntegration = true;

      programs.bash = {
        enable = true;

        bashrcExtra = ''
          [[ -x ${pkgs.nushell} ]] && SHELL=${pkgs.nushell} exec nu
        '';
      };

      programs.nushell = {
        enable = true;

        extraConfig = ''
          alias l = ${pkgs.eza}/bin/eza --icons --no-quotes --group-directories-first
          alias ll = l --binary --long --header
          alias la = ll --all

          ${pkgs.fastfetch}/bin/fastfetch
        '';

        settings = {
          show_banner = false;
          use_kitty_protocol = true;
          rm.always_trash = true;
        };
      };
    };
}
