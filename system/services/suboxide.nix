{inputs, ...}: {
  imports = [inputs.suboxide.nixosModules.suboxide];

  services.suboxide = {
    enable = true;
    port = 4040;
    openFirewall = true;
    user = "yunyun";
    group = "users";
    autoScan = false;
    # autoScanInterval = 30000;
    environmentFile = "/home/yunyun/suboxide.env";
    # environment = {
    #   RUST_LOG = "suboxide=debug";
    # };
  };
}
