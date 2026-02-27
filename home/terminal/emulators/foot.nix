{settings, ...}: let
  colors = settings.colors;
in {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "~/.config/foot/dank-colors.ini";
        term = "xterm-256color";
        title = "foot";
        letter-spacing = "0";
        font = "JetBrainsMono Nerd Font:size=${toString settings.fonts.terminalSize}";
        dpi-aware = "yes";
        pad = "10x10";
      };

      mouse = {
        hide-when-typing = "no";
      };

      # scroll-back = {
      #   line = "10000";
      # };

      cursor = {
        style = "beam";
        blink = "yes";
        beam-thickness = "1.5";
      };

      # colors = {
      #   foreground = builtins.replaceStrings ["#"] [""] colors.foreground;
      #   background = builtins.replaceStrings ["#"] [""] colors.background;
      #   regular0 = "000000";
      #   regular1 = "ec4899";
      #   regular2 = "22c55e";
      #   regular3 = "f97316";
      #   regular4 = "3b82f6";
      #   regular5 = "a855f7";
      #   regular6 = "06b6d4";
      #   regular7 = "737373";
      #   bright0 = "a3a3a3";
      #   bright1 = "f472b6";
      #   bright2 = "4ade80";
      #   bright3 = "fb923c";
      #   bright4 = "60a5fa";
      #   bright5 = "c084fc";
      #   bright6 = "22d3ee";
      #   bright7 = "FFFFFF";
      #   selection-foreground = builtins.replaceStrings ["#"] [""] colors.foreground;
      #   selection-background = builtins.replaceStrings ["#"] [""] colors.selection;
      #   search-box-no-match = "000000 f75f8f";
      #   search-box-match = "${builtins.replaceStrings ["#"] [""] colors.foreground} ${
      #     builtins.replaceStrings ["#"] [""] colors.selection
      #   }";
      #   jump-labels = "000000 ff9907";
      #   urls = "52a8ff";
      # };

      key-bindings = {
        scrollback-up-page = "Page_Up";
        scrollback-down-page = "Page_Down";
        clipboard-copy = "Control+Shift+c";
        clipboard-paste = "Control+Shift+v";
        search-start = "Control+Shift+f";
      };

      search-bindings = {
        cancel = "Escape";
        find-prev = "Control+Shift+n";
        find-next = "Shift+n";
      };
    };
  };
}
