{
  programs.nvf = {
    enable = true;
    settings.vim.languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      bash.enable = true;
      clang.enable = true;
      go.enable = true;
      java.enable = true;
      lua.enable = true;
      nix.enable = true;
      rust.enable = true;
      tailwind.enable = true;
      css = {
        enable = true;
        format.type = ["biome"];
      };
      ts = {
        enable = true;
        format.type = ["biome"];
      };
      typst.enable = true;
    };
  };
}
