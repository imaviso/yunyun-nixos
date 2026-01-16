{pkgs, ...}: {
  services.udev = {
    packages = with pkgs; [
      qmk-udev-rules
      vial
    ];
    extraRules = ''
      ATTRS{idVendor}=="373b", ATTRS{idProduct}=="10c9", ENV{ID_INPUT_KEYBOARD}="0"

      ATTRS{idVendor}=="373b", ATTRS{idProduct}=="110d", ENV{ID_INPUT_KEYBOARD}="0"
    '';
  };
}
