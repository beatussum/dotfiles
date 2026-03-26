{ inputs, ... }:
let
  inherit (inputs)
    nixpkgs
    disko
    home-manager
    treefmt-nix
    ;
in
{
  imports = [
    disko.flakeModule
    home-manager.flakeModules.default
    treefmt-nix.flakeModule
  ];

  perSystem =
    { system, ... }:
    {
      treefmt.programs.nixfmt.enable = true;
      _module.args.pkgs = nixpkgs.legacyPackages."${system}";
    };

  systems = [ "x86_64-linux" ];
}
