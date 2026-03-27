{
  flake.homeModules.librewolf =
    {
      pkgs,
      ...
    }:
    {
      stylix.targets.librewolf = {
        colors.enable = true;
        colorTheme.enable = true;
        profileNames = [ "matteo" ];
      };

      programs.librewolf = {
        enable = true;

        languagePacks = [
          "en-US"
          "fr"
        ];

        profiles.matteo = {
          extensions = with pkgs.nur.repos.rycee.firefox-addons; {
            force = true;

            packages = [
              firefox-color
              keepassxc-browser
              libredirect
              return-youtube-dislikes
              sponsorblock
              vimium
            ];
          };

          settings = {
            "extensions.autoDisableScopes" = 0;
            "extensions.update.autoUpdateDefault" = false;
            "extensions.update.enabled" = false;

            "intl.locale.requested" = "fr, en-US";
          };
        };
      };
    };
}
