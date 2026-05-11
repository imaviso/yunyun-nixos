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
      nix = {
        enable = true;
        format.type = ["alejandra"];
      };
      rust.enable = true;
      css = {
        enable = true;
        format.type = ["biome"];
      };
      typescript = {
        enable = true;
        format.type = ["biome"];
      };
      typst.enable = true;
    };

    settings.vim.lsp.presets.tailwindcss-language-server.enable = true;
  };
}
