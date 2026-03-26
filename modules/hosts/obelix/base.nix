{
  self,
  inputs,
  lib,
  ...
}:
{
  configurations.nixos.obelix =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.base
        self.nixosModules.l10n
        self.nixosModules.greetd
        self.nixosModules.matteo

        # disko
        inputs.disko.nixosModules.default
        self.diskoConfigurations.obelix
      ];

      environment.systemPackages = with pkgs; [
        vulnix
      ];

      networking.hostName = "obelix";
      nixpkgs.hostPlatform = lib.mkForce "x86_64-linux";
      system.stateVersion = "25.05";
    };
}
