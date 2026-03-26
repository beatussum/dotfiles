{
  flake.nixosModules.base =
    { pkgs, ... }:
    {
      hardware.nitrokey.enable = true;
      networking.networkmanager.enable = true;
      services.udisks2.enable = true;

      users = {
        mutableUsers = false;

        users.root = {
          hashedPassword = "!";
          shell = "${pkgs.util-linux}/bin/nologin";
        };
      };

      boot = {
        initrd.systemd.enable = true;

        loader.systemd-boot = {
          enable = true;
          editor = false;
        };
      };

      nix.settings.system-features = [
        "flakes"
        "nix-command"
        "pipe-operators"
      ];
    };
}
