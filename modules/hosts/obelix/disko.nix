{ lib, ... }:
{
  flake.diskoConfigurations.obelix = {
    disko = {
      devices = {
        disk = {
          main = {
            name = "obelix";
            type = "disk";
            device = lib.mkDefault "/dev/sda";
            imageSize = "8G";

            content = {
              type = "gpt";

              partitions = {
                esp = {
                  type = "EF00";
                  name = "obelix";
                  label = "obelix";
                  size = "512M";

                  content = {
                    type = "filesystem";
                    mountpoint = "/boot";
                    format = "vfat";

                    mountOptions = [
                      "defaults"
                      "nosuid"
                      "nodev"
                      "noexec"
                      "relatime"
                      "umask=0077"
                    ];
                  };
                };

                luks = {
                  type = "8309";
                  name = "crypted";
                  label = "crypted";
                  size = "100%";

                  content = {
                    type = "luks";
                    name = "crypted";
                    settings.crypttabExtraOpts = [ "fido2-device=auto" ];

                    content = {
                      type = "btrfs";

                      subvolumes =
                        let
                          mountOptions = [
                            "defaults"
                            "noatime"
                            "nodev"
                            "noexec"
                            "nosuid"
                          ];
                        in
                        {
                          "@" = {
                            mountpoint = "/";

                            mountOptions = [
                              "defaults"
                              "noatime"
                            ];
                          };

                          "@home" = {
                            inherit mountOptions;
                            mountpoint = "/home";
                          };

                          "@local" = {
                            inherit mountOptions;
                            mountpoint = "/usr/local";
                          };

                          "@nix" = {
                            inherit mountOptions;
                            mountpoint = "/nix";
                          };

                          "@root" = {
                            inherit mountOptions;
                            mountpoint = "/root";
                          };

                          "@var" = {
                            inherit mountOptions;
                            mountpoint = "/var";

                            swap."swapfile" = {
                              size = "16G";
                              path = "swapfile";
                            };
                          };
                        };
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
