{
  flake.homeModules.nushell =
    { config, pkgs, ... }:
    let
      eza = "${config.programs.eza.package}/bin/eza";
      nushell = "${config.programs.nushell.package}/bin/nu";
    in
    {
      home.shell.enableNushellIntegration = true;

      programs = {
        carapace.enable = true;

        bash = {
          enable = true;

          bashrcExtra = ''
            [[ -x ${nushell} ]] && SHELL=${nushell} exec ${nushell}
          '';
        };

        nushell = {
          enable = true;

          extraConfig = ''
            alias l = ${eza} --icons --no-quotes --group-directories-first
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
    };
}
