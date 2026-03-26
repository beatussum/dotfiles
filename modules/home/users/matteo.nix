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
          self.homeModules.fonts
          self.homeModules.helix
          self.homeModules.keepassxc
          self.homeModules.nushell
          self.homeModules.starship
          self.homeModules.yazi

          # Hyprland
          self.homeModules.hypridle
          self.homeModules.hyprlock
          self.homeModules.hyprpanel

          # stylix
          inputs.stylix.homeModules.stylix
          self.homeModules.stylix
        ];

        services = {
          ssh-agent.enable = true;
          swww.enable = true;
        };

        programs = {
          bat.enable = true;
          discord.enable = true;
          nix-index.enable = true;
        };

        xdg.autostart.enable = true;

        home = {
          packages = with pkgs; [
            comma
            nil
            signal-desktop
            vlc
          ];

          username = "matteo";
          homeDirectory = "/home/matteo";
          stateVersion = "25.05";
        };
      };
  };
}
