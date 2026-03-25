{ self, ... }:
{
  configurations.home = {
    users.matteo = {
      imports = [
        self.homeModules.eza
        self.homeModules.fastfetch
        self.homeModules.helix
        self.homeModules.nushell
        self.homeModules.starship
      ];
      
      home.username = "matteo";
      home.homeDirectory = "/home/matteo";
      home.stateVersion = "25.05";
    };
  };
}
