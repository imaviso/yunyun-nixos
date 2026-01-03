{inputs, ...}: {
  imports = [
    inputs.betterfox.homeModules.betterfox
  ];
  programs.firefox = {
    enable = true;
    betterfox = {
      enable = true;
      profiles.yunyun-profile = {
        enableAllSections = true;
      };
    };
    profiles.yunyun-profile = {
      name = "yunyun";
    };
  };
}
