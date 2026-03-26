{
  configurations.home.modules.hypridle =
    { pkgs, ... }:
    let
      hyprctl = "${pkgs.hyprland}/bin/hyprctl";
      loginctl = "${pkgs.systemd}/bin/loginctl";
      pidof = "${pkgs.procps}/bin/pidof";
      systemctl = "${pkgs.systemd}/bin/systemctl";
    in
    {
      services.hypridle = {
        enable = true;

        settings = {
          general = {
            lock_cmd = "${pidof} ${pkgs.hyprlock} || ${pkgs.hyprlock}";
            before_sleep_cmd = "${loginctl} lock-session";
            after_sleep_cmd = "${hyprctl} dispatch dpms on";
          };

          listener = [
            {
              timeout = 150;
              on-timeout = "${pkgs.brightnessctl} -s set 10";
              on-resume = "${pkgs.brightnessctl} -r";
            }

            {
              timeout = 150;
              on-timeout = "${pkgs.brightnessctl} -sd tpacpi::kbd_backlight set 0";
              on-resume = "${pkgs.brightnessctl} -rd tpacpi::kbd_backlight";
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
