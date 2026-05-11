{
  hostVars,
  lib,
  ...
}: let
  networkingVars = hostVars.networking or {};
  adguardVars = networkingVars.adguard or {};
  dnsBindHosts =
    adguardVars.dnsBindHosts
    or (lib.take 1 (networkingVars.nameservers or []));
in {
  services.adguardhome = {
    enable = true;
    settings.dns = {
      bind_hosts = dnsBindHosts;
      port = 53;
    };
  };
}
