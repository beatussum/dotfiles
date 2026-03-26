{
  flake.nixosModules.htop = {
    programs.htop = {
      enable = true;

      settings = {
      };
    };
  };
}
