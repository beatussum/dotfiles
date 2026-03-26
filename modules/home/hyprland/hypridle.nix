{
  flake.homeModules.hypridle =
    { pkgs, config, ... }:
    let
      loginctl = "${pkgs.systemd}/bin/loginctl";
      systemctl = "${pkgs.systemd}/bin/systemctl";

      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
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
              timeout = 150;
              on-timeout = "${brightnessctl} -s set 10";
              on-resume = "${brightnessctl} -r";
            }

            {
              timeout = 150;
              on-timeout = "${brightnessctl} -sd tpacpi::kbd_backlight set 0";
              on-resume = "${brightnessctl} -rd tpacpi::kbd_backlight";
            }

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
