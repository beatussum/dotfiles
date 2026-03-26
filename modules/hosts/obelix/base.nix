{
  self,
  inputs,
  lib,
  ...
}:
{
  configurations.nixos.obelix = {
    home-manager = {
      enable = true;

      module = {
        imports = [ inputs.home-manager.nixosModules.default ];

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
        };
      };
    };

    module = {
      imports = [
        self.nixosModules.base
        self.nixosModules.l10n
        self.nixosModules.greetd
        self.nixosModules.homeMatteo
        self.nixosModules.matteo

        # disko
        inputs.disko.nixosModules.default
        self.diskoConfigurations.obelix
      ];

      networking.hostName = "obelix";
      nixpkgs.hostPlatform = lib.mkForce "x86_64-linux";
      system.stateVersion = "25.05";
    };
  };
}
