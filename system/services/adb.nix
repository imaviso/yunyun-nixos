{pkgs, ...}: {
  programs.adb.enable = true;

  environment.systemPackages = [
    pkgs.universal-android-debloater
  ];
}
