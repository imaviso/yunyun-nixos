# Android/mobile development tools
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    scrcpy
    universal-android-debloater
  ];
}
