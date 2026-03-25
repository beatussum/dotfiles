{
  flake.nixosModules.l10n = {
    time.timeZone = "Europe/Paris";
    i18n.defaultLocale = "fr_FR.UTF-8";
  };
}
