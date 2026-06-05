{
  config,
  pkgs,
  ...
}: {
  programs.beets = {
    enable = true;
    package = pkgs.beets;
    settings = {
      directory = "/mnt/media/beets/Music";
      library = "/mnt/media/beets/musiclibrary.db";
      threaded = true;
      plugins = [
        "chroma" # Acoustic fingerprinting via Acoustid
        "fetchart" # Automatically download album art from the web
        "embedart" # Embed downloaded album art directly into audio files
        "musicbrainz"
        "lastgenre" # Fetch genres from Last.fm tags
        "lyrics"
        "inline" # Allow custom python snippets inside path formats
        "replaygain" # Calculate volume normalization metadata
        "scrub" # Clean out unwanted/crufty tags before rewriting
        "info" # Command line utility to print file metadata
      ];

      chroma = {
        auto = true;
      };

      fetchart = {
        auto = true;
        minwidth = 500;
        maxwidth = 2000;
        cautious = true;
        sources = ["filesystem" "coverart" "itunes" "amazon" "albumart"];
      };

      embedart = {
        auto = true;
        ifempty = true;
      };

      lastgenre = {
        auto = true;
        canonical = true; # Map tags to a standardized tree of genres
        count = 3; # Evaluate top 3 tags
      };

      replaygain = {
        auto = true;
        backend = "ffmpeg";
      };

      scrub = {
        auto = true;
      };
    };
  };
}
