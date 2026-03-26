{
  flake.nixosModules.greetd = {
    services.greetd = {
      enable = true;
      useTextGreeter = true;
    };
  };
}
