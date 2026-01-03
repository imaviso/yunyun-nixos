# Hardware configuration placeholder for laptop
# Generate with: nixos-generate-config --show-hardware-config > hardware.nix
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # Boot configuration - customize for your hardware
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "thunderbolt"
    "nvme"
    "usb_storage"
    "sd_mod"
  ];
  boot.kernelModules = ["kvm-intel"]; # or kvm-amd

  # Filesystems - configure for your disk layout
  # fileSystems."/" = {
  #   device = "/dev/disk/by-uuid/YOUR-UUID-HERE";
  #   fsType = "ext4"; # or btrfs, etc.
  # };
  # fileSystems."/boot" = {
  #   device = "/dev/disk/by-uuid/YOUR-BOOT-UUID";
  #   fsType = "vfat";
  # };

  # Hardware
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
