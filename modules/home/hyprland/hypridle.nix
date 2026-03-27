{
  flake.homeModules.hypridle =
    { pkgs, config, ... }:
    let
      loginctl = "${pkgs.systemd}/bin/loginctl";
      systemctl = "${pkgs.systemd}/bin/systemctl";

      hyprctl = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl";
      hyprlock = "${pkgs.hyprlock}/bin/hyprlock";
      pidof = "${pkgs.procps}/bin/pidof";
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
