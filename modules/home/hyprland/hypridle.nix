{
  flake.homeModules.hypridle =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    let
      loginctl = lib.getExe' pkgs.systemd "loginctl";
      systemctl = lib.getExe' pkgs.systemd "systemctl";

      hyprctl = lib.getExe' config.wayland.windowManager.hyprland.package "hyprctl";
      hyprlock = lib.getExe pkgs.hyprlock;
      pidof = lib.getExe' pkgs.procps "pidof";
    in
    {
      services.hypridle = {
        enable = true;

        settings = {
          general = {
            lock_cmd = "${pidof} ${hyprlock} || ${hyprlock}";
            before_sleep_cmd = "${loginctl} lock-session";
            after_sleep_cmd = "${hyprctl} dispatch dpms on";
          };

          listener = [
            {
              timeout = 330;
              on-timeout = "${hyprctl} dispatch dpms off";
              on-resume = "${hyprctl} dispatch dpms on";
            }

            {
              timeout = 420;
              on-timeout = "${loginctl} lock-session";
            }

            {
              timeout = 900;
              on-timeout = "${systemctl} suspend";
            }
          ];
        };
      };
    };
}
