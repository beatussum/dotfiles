{
  flake.homeModules.xdg =
    { config, ... }:
    let
      home = config.home.homeDirectory;
    in
    {
      xdg = {
        enable = true;
        autostart.enable = true;

        userDirs = {
          enable = true;
          createDirectories = true;

          documents = "${home}/Documents";
          download = "${home}/Telechargements";
          music = "${home}/Musiques";
          pictures = "${home}/Images";
          publicShare = "${home}/Public";
          templates = "${home}/Patrons";
          videos = "${home}/Videos";
        };
      };
    };
}
