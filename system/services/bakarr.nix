{inputs, ...}: {
  imports = [inputs.bakarr.nixosModules.bakarr];

  services.bakarr = {
    enable = true;
    port = 8000;
    openFirewall = true;
    user = "yunyun";
    group = "users";

    environment = {
      BAKARR_BOOTSTRAP_USERNAME = "admin";
      SESSION_COOKIE_SECURE = false;
    };
  };
}
