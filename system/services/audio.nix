{pkgs, ...}: {
  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
    extraConfig.pipewire = {
      "92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [
            44100
            48000
            88200
            96000
            176400
            192000
          ];
          "default.clock.quantum" = 256;
          "default.clock.min-quantum" = 256;
          "default.clock.max-quantum" = 512;
        };

        "93-resampling" = {
          "stream.properties" = {
            "resampling.quality" = 10;
          };
        };
      };
    };

    # wireplumber.extraConfig.bluetoothEnhancements = {
    #   "monitor.bluez.properties" = {
    #     "bluez5.enable-sbc-xq" = true;
    #     "bluez5.enable-msbc" = true;
    #     "bluez5.enable-hw-volume" = true;
    #     "bluez5.roles" = [
    #       "hsp_hs"
    #       "hsp_ag"
    #       "hfp_hf"
    #       "hfp_ag"
    #     ];
    #   };
    # };
  };
}
