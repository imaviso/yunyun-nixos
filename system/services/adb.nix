{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    universal-android-debloater
    android-tools
    scrcpy
    v4l-utils
  ];
}
