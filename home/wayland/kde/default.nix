{
  pkgs,
  inputs,
  settings,
  ...
}: {
  imports = [inputs.plasma-manager.homeModules.plasma-manager];

  home.packages = with pkgs; [
    apple-cursor
    papirus-icon-theme
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor.theme = settings.appearance.cursor.name;
      cursor.size = settings.appearance.cursor.size;
      iconTheme = settings.appearance.iconTheme;
      # wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
    };

    fonts = {
      general = {
        family = settings.fonts.sans;
        pointSize = settings.fonts.uiSize;
      };
      fixedWidth = {
        family = settings.fonts.mono;
        pointSize = settings.fonts.terminalSize;
      };
    };

    # hotkeys = {
    #   commands."launch-ghostty" = {
    #     name = "Launch Ghostty";
    #     key = "Meta+Return";
    #     command = "ghostty";
    #   };
    #
    #   commands."launch-foot" = {
    #     name = "Launch foot";
    #     key = "Meta+Space";
    #     command = "footclient";
    #   };
    #
    #   commands."launch-vicinae" = {
    #     name = "Launch vicinae";
    #     key = "Meta+D";
    #     command = "vicinae toggle";
    #   };
    # };

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
      # Global menu at the top
      {
        location = "top";
        height = 26;
        widgets = ["org.kde.plasma.appmenu"];
      }
    ];

    #
    # Some mid-level settings:
    #
    # shortcuts = {
    #   ksmserver = {
    #     "Lock Session" = [
    #       "Screensaver"
    #       "Meta+Ctrl+Alt+L"
    #     ];
    #   };
    #
    #   kwin = {
    #     "Show Desktop" = "none";
    #     "Overview" = "Meta+,";
    #     "Switch Window Down" = "Meta+J";
    #     "Switch Window Left" = "Meta+H";
    #     "Switch Window Right" = "Meta+L";
    #     "Switch Window Up" = "Meta+K";
    #     "Maximize Window" = "Meta+F";
    #     "Close Window" = "Meta+Shift+Q";
    #     "Switch to Desktop 1" = "Meta+1";
    #     "Switch to Desktop 2" = "Meta+2";
    #     "Switch to Desktop 3" = "Meta+3";
    #     "Window to Desktop 1" = "Meta+Shift+1";
    #     "Window to Desktop 2" = "Meta+Shift+2";
    #     "Window to Desktop 3" = "Meta+Shift+3";
    #   };
    # };

    #
    # Some low-level settings:
    #
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "SF";
      "kwinrc"."Desktops"."Number" = {
        value = 3;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
    };

    input = {
      keyboard = {
        layouts = [
          {
            layout = settings.input.keyboardLayout;
            variant = settings.input.keyboardVariant;
          }
        ];
        repeatDelay = settings.input.repeatDelay;
        repeatRate = settings.input.repeatRate;
        options = [settings.input.keyboardOptions];
      };
      mice = [
        {
          name = "Compx Nearlink Mouse Dongle";
          vendorId = "373b";
          productId = "10c9";
          accelerationProfile =
            if settings.input.accelProfile == "flat"
            then "none"
            else "default";
        }
      ];
    };
  };
}
