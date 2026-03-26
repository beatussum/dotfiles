{ self, inputs, ... }:
{
  configurations.home.matteo = {
    pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";

    module =
      { lib, pkgs, ... }:
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
          protonmail-bridge.enable = true;
          ssh-agent.enable = true;
          swww.enable = true;
        };

        programs = {
          bat.enable = true;
          discord.enable = true;
          nix-index.enable = true;
        };

        nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "discord" ];
        xdg.autostart.enable = true;

        home = {
          packages = with pkgs; [
            comma
            nil
            nitrokey-app2
            proton-vpn
            pynitrokey
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
