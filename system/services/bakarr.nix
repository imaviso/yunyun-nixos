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
      SESSION_COOKIE_SECURE = false;
    };

    observability = {
      otlpEndpoint = "http://192.168.254.2:4318";
      deploymentEnvironment = "home";
      metricsRequireAuth = false;
      grafanaUrl = "http://192.168.254.2:3000";
      victoriaMetricsUrl = "http://192.168.254.2:8428";
      tempoUrl = "http://192.168.254.2:3200";
      lokiUrl = "http://192.168.254.2:3100";
    };
  };
}
