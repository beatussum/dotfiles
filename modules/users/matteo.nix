{
  flake.nixosModules.matteo = {
    users.users.matteo = {
      description = "Mattéo Rossillol‑‑Laruelle";
      extraGroups = [ "wheel" ];
      isNormalUser = true;
      initialPassword = "aa";
    };
  };
}
