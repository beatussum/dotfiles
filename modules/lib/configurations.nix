{
  inputs,
  lib,
  config,
  ...
}:
{
  options = {
    configurations = lib.mkOption {
      type = lib.types.submodule {
        options = {
          home = lib.mkOption {
            type = lib.types.lazyAttrsOf (
              lib.types.submodule {
                options = {
                  pkgs = lib.mkOption {
                    type = lib.types.pkgs;
                  };

                  module = lib.mkOption {
                    type = lib.types.deferredModule;
                  };
                };
              }
            );
          };

          nixos = lib.mkOption {
            type = lib.types.lazyAttrsOf lib.types.deferredModule;
          };
        };
      };
    };
  };

  config = {
    flake = {
      homeConfigurations = lib.mapAttrs (
        name:
        { pkgs, module }:
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ module ];
        }
      ) config.configurations.home;

      nixosConfigurations = lib.mapAttrs (
        name: module:
        inputs.nixpkgs.lib.nixosSystem {
          modules = [ module ];
        }
      ) config.configurations.nixos;
    };
  };
}
