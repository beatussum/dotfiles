{ inputs, ... }:
let
  inherit (inputs) nixpkgs disko home-manager;
in
  {
    imports = [
      disko.flakeModule
      home-manager.flakeModules.default
    ];

    perSystem = { system, ...  }: {
      _module.args.pkgs = import nixpkgs { inherit system; };
    };

    systems = [ "x86_64-linux" ];
  }
