{pkgs, ...}: {
  # programs.chromium = {
  #   enable = true;
  #   package = pkgs.ungoogled-chromium;
  # };
  environment.systemPackages = [
    pkgs.ungoogled-chromium
  ];
  nixpkgs.config.chromium.commandLineArgs = "--enable-features=AcceleratedVideoDecodeLinuxGL";
}
