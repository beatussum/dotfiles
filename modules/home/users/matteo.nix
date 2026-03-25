{ self, ... }:
{
  configurations.home = {
    users.matteo = {
      imports = [
        self.homeModules.eza
        self.homeModules.fastfetch
        self.homeModules.helix
        self.homeModules.keepassxc
        self.homeModules.nushell
        self.homeModules.starship
      ];

      xdg.autostart.enable = true;

      home = {
        username = "matteo";
        homeDirectory = "/home/matteo";
        stateVersion = "25.05";
      };
    };
  };
}
