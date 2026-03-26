{ self, inputs, ... }:
{
  configurations.home.matteo = {
    pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
    module =
      { pkgs, ... }:
      {
        imports = [
          self.homeModules.eza
          self.homeModules.fastfetch
          self.homeModules.helix
          self.homeModules.keepassxc
          self.homeModules.nushell
          self.homeModules.starship
          self.homeModules.yazi

          # Hyprland
          self.homeModules.hypridle
          self.homeModules.hyprlock
          self.homeModules.hyprpanel
        ];

        services = {
          ssh-agent.enable = true;
          swww.enable = true;
        };

        xdg.autostart.enable = true;

        home = {
          packages = with pkgs; [
            comma
            vlc
          ];

          username = "matteo";
          homeDirectory = "/home/matteo";
          stateVersion = "25.05";
        };
      };
  };
}
