{
  config,
  pkgs,
  ...
}: let
  browser = ["firefox"];
  imageViewer = ["swappy"];
  mediaPlayer = ["mpv"];
  archive = ["org.gnome.FileRoller"];

  xdgAssociations = type: program: list:
    builtins.listToAttrs (
      map (e: {
        name = "${type}/${e}";
        value = program;
      })
      list
    );

  image = xdgAssociations "image" imageViewer [
    "png"
    "svg+xml"
    "jpeg"
    "gif"
    "webp"
    "avif"
  ];
  video = xdgAssociations "video" mediaPlayer [
    "mp4"
    "avi"
    "mkv"
  ];
  audio = xdgAssociations "audio" mediaPlayer [
    "x-mp3"
    "x-flac"
    "x-vorbis"
    "x-wav"
    "aac"
    "ogg"
    "opus"
  ];
  browserTypes =
    (xdgAssociations "application" browser [
      "x-extension-htm"
      "x-extension-html"
      "x-extension-shtml"
      "x-extension-xht"
      "x-extension-xhtml"
      "xhtml+xml"
    ])
    // (xdgAssociations "x-scheme-handler" browser [
      "about"
      "chrome"
      "ftp"
      "http"
      "https"
      "unknown"
    ]);

  archives = xdgAssociations "application" archive [
    "zip"
    "vnd.rar"
    "x-7z-compressed"
    "x-tar"
    "gzip"
    "x-bzip"
    "x-bzip2"
    "x-xz"
    "x-rar-compressed"
  ];

  # XDG MIME types
  associations = builtins.mapAttrs (_: v: (map (e: "${e}.desktop") v)) (
    {
      "application/pdf" = ["org.pwmt.zathura-pdf-mupdf"];
      "text/html" = browser;
      "text/plain" = ["Helix"];
      "json" = ["Helix"];
      "inode/directory" = ["yazi"];
      "x-scheme-handler/magnet" = ["transmission-gtk"];
      # Full entry is org.telegram.desktop.desktop
      "x-scheme-handler/tg" = ["org.telegram.desktop"];
      "x-scheme-handler/tonsite" = ["org.telegram.desktop"];
    }
    // image
    // video
    // audio
    // browserTypes
    // archives
  );
in {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };

  home.packages = [
    # used by `gio open` and xdp-gtk
    (pkgs.writeShellScriptBin "xdg-terminal-exec" ''
      foot "$@"
    '')
    pkgs.xdg-utils
    # pkgs.loupe
    pkgs.zathura
  ];
}
