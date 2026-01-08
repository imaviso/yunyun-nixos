{
  inputs,
  username,
  ...
}: {
  imports = [
    inputs.betterfox.homeModules.betterfox
  ];
  programs.firefox = {
    enable = true;
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
