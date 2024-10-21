{ config, lib, pkgs, ... }:

let
  multiScrobbler = pkgs.callPackage ./multi-scrobbler.nix {};
in

{
  # Import necessary modules
  imports = [ ];

  # System services configuration
  services.multi-scrobbler = {
    enable = true;

    # Working directory for the service
    serviceConfig.WorkingDirectory = "/var/lib/multi-scrobbler";

    # Service parameters
    serviceConfig.Type = "simple";
    serviceConfig.Restart = "no"; # Restart the service if it crashes
    serviceConfig.User = "minipc"; # Run the service as a specific user
    serviceConfig.Group = "users"; # Run the service as a specific group

    # Environment variables for the service
    serviceConfig.Environment = {
      # Example environment variables, adjust as needed
      LOG_LEVEL = "info";
      # Add other environment variables required by multi-scrobbler
    };

    # ExecStart command to start the service
    serviceConfig.ExecStart = "${multiScrobbler}/node_modules/.bin/node src/index.js";
  };

  # Optionally, add the service to the system services list
  systemd.services.multi-scrobbler.after = [ "network.target" ];
  systemd.services.multi-scrobbler.wantedBy = [ "multi-user.target" ];
}
