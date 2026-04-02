{
  flake.homeModules.caelestia =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      quickToggles = lib.map (id: {
        inherit id;
        enabled = true;
      });

      kitty = lib.getExe pkgs.kitty;
      systemd = lib.getExe' pkgs.systemd "systemd";
      yazi = lib.getExe pkgs.yazi;
    in
    {
      home.packages = with pkgs; [
        material-symbols
        nerd-fonts.caskaydia-cove
        rubik
      ];

      services.cliphist.enable = true;

      programs.caelestia = {
        enable = true;

        settings = {
          appearance.transparency.enabled = true;

          general = {
            excludedScreens = [
              "HDMI-A-1"
              "DP-1"
            ];

            apps = {
              terminal = [ kitty ];
              explorer = [ yazi ];
            };

            idle.timeouts = [
              {
                timeout = 300;
                idleAction = "dpms off";
                returnAction = "dpms on";
              }

              {
                timeout = 600;
                idleAction = "lock";
              }

              {
                timeout = 900;

                idleAction = [
                  systemd
                  "suspend-then-hibernate"
                ];
              }
            ];
          };

          bar = {
            workspaces = {
              perMonitorWorkspaces = false;
              windowIcons = null;
            };

            activeWindow.compact = true;
            tray.recolour = true;

            status = {
              showAudio = true;
              showMicrophone = true;
              showKbLayout = true;
              showBattery = false;
            };
          };

          launcher.sizes = {
            itemWidth = 1200;
            itemHeight = 90;
            wallpaperWidth = 560;
            wallpaperHeight = 400;
          };

          notifs.sizes.width = 800;

          osd = {
            enableBrightness = false;
            enableMicrophone = true;

            sizes = {
              sliderWidth = 40;
              sliderHeight = 300;
            };
          };

          session.sizes.button = 120;

          lock = {
            recolourLogo = true;
            enableFprint = false;
            centerWidth = 1200;
          };

          utilities = {
            quickToggles = quickToggles [
              "wifi"
              "bluetooth"
              "mic"
              "settings"
              "dnd"
            ];

            sizes = rec {
              width = 600;
              toastWidth = width;
            };

            toasts.nowPlaying = true;
          };

          services = {
            defaultPlayer = null;
            playerAliases = null;
          };

          paths = {
            wallpaperDir = "${config.xdg.userDirs.pictures}/Wallpapers";
            lyricsDir = "${config.xdg.userDirs.music}/Lyrics";
            sessionGif = null;
            mediaGif = null;
            noNotifsPic = null;
            lockNoNotifsPic = null;
          };
        };

        cli = {
          enable = true;

          settings = {
            theme = {
              enableTerm = false;
              enableHypr = false;
              enableDiscord = false;
              enableSpicetify = false;
              enableFuzzel = false;
              enableBtop = false;
              enableGtk = false;
              enableQt = false;
            };

            toggles = {
              communication.whatsapp.enable = false;

              music = {
                spotify.enable = false;
                feishin.enable = false;
              };

              todo.todoist.enable = false;
            };
          };
        };
      };
    };
}
