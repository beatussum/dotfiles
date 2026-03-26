{ inputs, lib, config, pkgs, ... }:
{
  options = {
    configurations = lib.mkOption {
      type = lib.types.submodule {
        options = {
          home = lib.mkOption {
            type = lib.types.submodule {
              options = {
                modules = lib.mkOption {
                  type = lib.types.lazyAttrsOf lib.types.deferredModule;
                };

                users = lib.mkOption {
                  type = lib.types.lazyAttrsOf lib.types.deferredModule;
                };
              };
            };
          };
        
          nixos = lib.mkOption {
            type = lib.types.lazyAttrsOf (lib.types.submodule {
              options = {
                home-manager = lib.mkOption {
                  type = lib.types.submodule {
                    options = {
                      enable = lib.mkEnableOption "home-manager";

                      module = lib.mkOption {
                        default = inputs.home-manager.nixosModules.default;
                        type = lib.types.deferredModule;
                      };
                    };
                  };
                };

                module = lib.mkOption {
                  type = lib.types.deferredModule;
                };
              };
            });
          };
        };
      };
    };
  };
  
  config = {
    flake = {
      homeModules = config.configurations.home.modules;
      
      nixosModules =
        lib.mapAttrs'
        (user: module: lib.nameValuePair (lib.toCamelCase "home-${user}") { home-manager.users."${user}" = module; })
        config.configurations.home.users;
      
      homeConfigurations =
        lib.mapAttrs
        (name: module: inputs.home-manager.lib.homeManagerConfiguration { inherit pkgs; modules = [ module ]; })
        config.configurations.home.users;
      
      nixosConfigurations =
        lib.mapAttrs
        (name: { home-manager, module }: inputs.nixpkgs.lib.nixosSystem { modules = [ module ] ++ (lib.optional (home-manager.enable) home-manager.module); })
        config.configurations.nixos;
    };
  };
}
