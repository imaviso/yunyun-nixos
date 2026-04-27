# Helper function to create NixOS host configurations
{
  inputs,
  lib,
}: {
  # Create a NixOS system configuration
  # Args:
  #   hostname: string - the hostname/config name
  #   system: string - the system architecture (default: x86_64-linux)
  #   username: string - the primary user (default: yunyun)
  #   homeDirectory: string - the user's home directory (default: /home/${username})
  #   nixosModules: list - additional NixOS modules to include
  #   homeModules: list - additional home-manager modules to include
  #   extraSpecialArgs: attrset - extra args passed to modules
  mkHost = {
    hostname,
    system ? "x86_64-linux",
    username ? "yunyun",
    homeDirectory ? "/home/${username}",
    nixosModules ? [],
    homeModules ? [],
    extraSpecialArgs ? {},
  }: let
    # Default settings - can be overridden in hostVars.settings
    defaultSettings = {
      # Input/keyboard settings
      input = {
        keyboardLayout = "us";
        keyboardVariant = "";
        keyboardOptions = "caps:escape";
        repeatDelay = 250;
        repeatRate = 35;
        accelProfile = "flat";
      };

      # Appearance settings
      appearance = {
        cursor = {
          name = "macOS";
          size = 24;
        };
        gtkTheme = "adw-gtk3-dark";
        # qtStyle = "adwaita-dark";
        qtPlatformTheme = "qtct";
        iconTheme = "Papirus-Dark";
        preferDark = true;
      };

      # Font settings
      fonts = {
        sans = "Google Sans";
        serif = "Google Sans";
        mono = "TX-02";
        terminal = "TX-02";
        terminalSize = 12;
        uiSize = 10;
        emoji = "Noto Color Emoji";
      };

      # Default applications
      apps = {
        terminal = "footclient";
        terminalAlt = "ghostty";
        terminalServer = "foot";
        fileManager = "thunar";
        fileManagerTUI = "yazi";
        browser = "chromium";
        editor = "nvim";
        playback = "mpv";
      };

      # Window manager layout settings
      layout = {
        gapsInner = 5;
        gapsOuter = 10;
        borderSize = 1;
        cornerRadius = 5;
      };

      # Animation settings
      animation = {
        enabled = true;
        duration = 200;
      };

      # Workspace settings
      workspaces = {
        count = 10;
        gridWidth = 3;
        gridHeight = 3;
      };

      # Path settings
      paths = {
        wallpapers = "Pictures/Wallpapers";
        screenshots = "Pictures/Screenshots";
        flake = "nixos";
      };

      # Locale settings
      locale = {
        timezone = "Asia/Manila";
        defaultLocale = "en_US.UTF-8";
      };

      # User/git settings
      user = {
        name = "imaviso";
        email = "mail@imaviso.com";
      };

      # Color scheme
      colors = {
        background = "#0A0A0A";
        foreground = "#FAFAFA";
        selection = "#262626";
        borderActive = "#737373";
        borderInactive = "#0a0a0a";
      };
    };

    # Load host-specific variables if they exist
    hostVarsPath = ../hosts/${hostname}/vars.nix;
    hostVarsRaw =
      if builtins.pathExists hostVarsPath
      then import hostVarsPath
      else {
        monitors = [];
        settings = {};
      };

    # Deep merge settings: hostVars.settings overrides defaultSettings
    mergedSettings = lib.recursiveUpdate defaultSettings (hostVarsRaw.settings or {});

    # Final hostVars with merged settings
    hostVars = hostVarsRaw // {settings = mergedSettings;};

    # Merge all special args
    allSpecialArgs =
      {
        inherit inputs hostname username hostVars;
        monitors = hostVars.monitors or [];
        settings = mergedSettings;
      }
      // extraSpecialArgs;
  in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = allSpecialArgs;
      modules =
        [
          # Host-specific configuration
          ../hosts/${hostname}

          inputs.hm.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "bk";
              extraSpecialArgs = allSpecialArgs;
              users.${username} = {
                imports = homeModules;
                home = {
                  inherit username homeDirectory;
                  stateVersion = "24.05";
                };
              };
            };
          }
        ]
        ++ nixosModules;
    };
}
