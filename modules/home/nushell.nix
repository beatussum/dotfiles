{
  configurations.home.modules.nushell = { pkgs, ... }: {
    home.shell.enableNushellIntegration = true;

    programs.nushell = {
      enable = true;

      extraConfig = ''
        alias l = ${pkgs.eza} --icons --no-quotes --group-directories-first
        alias ll = l --binary --long --header
        alias la = ll --all
        
        ${pkgs.fastfetch}
      '';

      settings = {
        env.config = {
          show_banner = false;
          use_kitty_protocol = true;
          rm.always_trash = true;
        };
      };
    };
  };
}
