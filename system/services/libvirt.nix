{ pkgs, lib, ...} : {

    boot = {
    initrd.kernelModules = [
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
    ];

    kernelParams = [
      # Enable IOMMU
      "amd_iommu=on"
      "iommu=pt"
      "pcie_acs_override=downstream,multifunction"
      "video=efifb:off"
    ];

    kernelPatches = [
      {
        name = "drm-kms-helper-config";
        patch = null;
        structuredExtraConfig = {
          DRM_KMS_HELPER = lib.kernel.no;
        };
      }
    ];
  };

  environment.systemPackages = [
    pkgs.virt-manager
  ];
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };
}
