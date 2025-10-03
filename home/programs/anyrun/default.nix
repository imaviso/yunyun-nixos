{
  pkgs,
  inputs,
  ...
}:
{
  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/libsymbols.so"
        "${pkgs.anyrun}/lib/librink.so"
        "${pkgs.anyrun}/lib/libshell.so"
        "${pkgs.anyrun}/lib/librandr.so"
        "${pkgs.anyrun}/lib/libwebsearch.so"
      ];

      width.fraction = 0.25;
      y.fraction = 0.3;
      hidePluginInfo = true;
      closeOnClick = true;
    };

    extraCss = builtins.readFile (./. + "/style.css");

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: false,
          max_entries: 5,
          preprocess_exec_script: Some("app2unit -- ")
          terminal: Some(Terminal(
            command: "foot",
            args: "-e {}",
          )),
        )
      '';

      "shell.ron".text = ''
        Config(
          prefix: ">"
        )
      '';

      "randr.ron".text = ''
        Config(
          prefix: ":dp",
          max_entries: 5,
        )
      '';
      "websearch.ron".text = ''
        Config(
          prefix: "?",
          Custom(
            name: "Searxng",
            url: "search.momoyan.org/search?q={}",
          )
          engines: [Searxng]
        )
      '';
    };
  };
}
