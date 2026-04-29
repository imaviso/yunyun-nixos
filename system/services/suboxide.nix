{inputs, ...}: {
  imports = [inputs.suboxide.nixosModules.suboxide];

  services.suboxide = {
    enable = true;
    port = 4040;
    openFirewall = true;
    user = "yunyun";
    group = "users";
    autoScan = true;
    autoScanInterval = 30000;
    environment = {
      RUST_LOG = "suboxide=debug";
    };
  };
}
