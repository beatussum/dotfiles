{
  flake.homeModules.nushell =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    let
      eza = lib.getExe config.programs.eza.package;
      nushell = lib.getExe config.programs.nushell.package;
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

            ${lib.getExe pkgs.fastfetch}
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
