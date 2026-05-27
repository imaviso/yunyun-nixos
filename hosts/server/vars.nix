# Host-specific variables for laptop
# Only hardware-specific data that modules need to read
{
  gpu = "intel"; # or "nvidia", "amd"

  # Networking configuration
  networking = {
    backend = "networkd";
    nameservers = [
      "192.168.254.191"
    ];
    timeServers = [
      "time.cloudflare.com"
      "0.ph.pool.ntp.org"
    ];
    trustedSubnets = ["192.168.254.0/24"];
    adguard.dnsBindHosts = ["192.168.254.191"];
  };
}
