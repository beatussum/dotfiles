{ self, ... }:
{
  configurations.home = {
    users.matteo = { pkgs, ... }: {
      imports = [
        self.homeModules.eza
        self.homeModules.fastfetch
        self.homeModules.helix
        self.homeModules.keepassxc
        self.homeModules.nushell
        self.homeModules.starship

        # Hyprland
        self.homeModules.hyprlock
        self.homeModules.hyprpanel
      ];

      services.ssh-agent.enable = true;
      xdg.autostart.enable = true;

      home = {
        packages = [
          pkgs.vlc
        ];

        username = "matteo";
        homeDirectory = "/home/matteo";
        stateVersion = "25.05";
      };
    };
  };
}
