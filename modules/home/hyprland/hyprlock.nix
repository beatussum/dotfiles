{
  configurations.home.modules.hyprlock =
    { pkgs, ... }:
    let
      date = "${pkgs.coreutils}/bin/date";
      tr = "${pkgs.coreutils}/bin/tr";
    in
    {
      home.packages = [
        pkgs.geist-font
        pkgs.jetbrains-mono
      ];

      programs.hyprlock = {
        enable = true;

        settings = {
          background = [
            {
              blur_size = 4;
              blur_passes = 3;
              noise = 0.0117;
              contrast = 1.3000;
              brightness = 0.8000;
              vibrancy = 0.2100;
              vibrancy_darkness = 0.0;
            }
          ];

          label = [
            # Hours
            {
              text = "cmd[update:1000] echo \"<b><big> $(${date} +\"%H\") </big></b>\"";
              font_size = 112;
              font_family = "Geist Mono 10";
              shadow_passes = 3;
              shadow_size = 4;

              position = "0, 220";
              halign = "center";
              valign = "center";
            }

            # Minutes
            {
              text = "cmd[update:1000] echo \"<b><big> $(${date} +\"%M\") </big></b>\"";
              font_size = 112;
              font_family = "Geist Mono 10";
              shadow_passes = 3;
              shadow_size = 4;

              position = "0, 80";
              halign = "center";
              valign = "center";
            }

            # Today
            {
              text = "cmd[update:18000000] echo \"<b><big> \"$(${date} +'%A')\" </big></b>\"";
              font_size = 22;
              font_family = "JetBrainsMono Nerd Font 10";

              position = "0, -30";
              halign = "center";
              valign = "center";
            }

            # Week
            {
              text = "cmd[update:18000000] echo \"<b> \"$(${date} +'%d %b')\" </b>\"";
              font_size = 18;
              font_family = "JetBrainsMono Nerd Font 10";

              position = "0, -70";
              halign = "center";
              valign = "center";
            }

            # Degrees
            {
              text = "cmd[update:18000000] echo \"<b> Ressenti <big>$(${pkgs.curl} -s 'wttr.in?format=%t' | ${tr} -d '+')</big></b>\"";
              font_size = 18;
              font_family = "Geist Mono 10";

              position = "0, 40";
              halign = "center";
              valign = "bottom";
            }
          ];

          input-field = [
            {
              size = "250, 50";
              outline_thickness = 3;

              dots_size = 0.26;
              dots_spacing = 0.64;
              dots_center = true;
              dots_rouding = -1;

              rounding = 22;
              fade_on_empty = true;
              placeholder_text = "<i>Mot de passe…</i>";

              position = "0, 120";
              halign = "center";
              valign = "bottom";
            }
          ];
        };
      };
    };
}
