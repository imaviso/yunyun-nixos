{
  config,
  inputs,
  username,
  ...
}: {
  imports = [
    inputs.betterfox.homeModules.betterfox
  ];
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    betterfox = {
      enable = true;
      profiles."${username}-profile" = {
        enableAllSections = true;
      };
    };
    profiles."${username}-profile" = {
      name = username;
    };
  };
}
