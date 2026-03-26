{
  flake.nixosModules.matteo = { pkgs, ... }: {
    users.users.matteo = {
      description = "Mattéo Rossillol‑‑Laruelle";
      extraGroups = [ "wheel" ];
      isNormalUser = true;
      initialPassword = "aa";
      shell = pkgs.bash;
    };
  };
}
