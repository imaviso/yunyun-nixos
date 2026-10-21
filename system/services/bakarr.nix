{inputs, ...}: {
  imports = [inputs.bakarr.nixosModules.default];

  services.bakarr = {
    enable = true;
    port = 8000;
    user = "yunyun";
    group = "users";
    openFirewall = true;
    environment = {
      BAKARR_BOOTSTRAP_USERNAME = "admin";
      BAKARR_TRUSTED_HOSTS = "anime.imaviso.com";
      SESSION_COOKIE_SECURE = false;
    };
  };
}
