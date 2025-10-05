{
  config,
  pkgs,
  lib,
  ...
}:
let
  biome = ext: {
    command = lib.getExe pkgs.biome;
    args = [
      "format"
      "--stdin-file-path"
      "buffer.${ext}"
      "-"
    ];
  };
in
{
  programs.helix.languages = {
    language = [
      {
        name = "bash";
        auto-format = true;
        formatter = {
          command = lib.getExe pkgs.shfmt;
          args = [
            "-i"
            "2"
          ];
        };
      }
      {
        name = "cmake";
        auto-format = true;
        language-servers = [ "cmake-language-server" ];
        formatter = {
          command = lib.getExe pkgs.cmake-format;
          args = [ "-" ];
        };
      }
      {
        name = "css";
        formatter = {
          command = lib.getExe pkgs.nodePackages.prettier;
          args = [
            "--parser"
            "css"
          ];
        };
        language-servers = [
          "vscode-css-language-server"
          "tailwindcss-ls"
        ];
      }
      {
        name = "javascript";
        auto-format = true;
        formatter = biome "js";
        language-servers = [
          "typescript-language-server"
        ];
      }
      {
        name = "json";
        auto-format = true;
        formatter = biome "json";
      }
      {
        name = "html";
        formatter = {
          command = lib.getExe pkgs.nodePackages.prettier;
          args = [
            "--parser"
            "html"
          ];
        };
        language-servers = [
          "vscode-html-language-server"
          "tailwindcss-ls"
        ];
      }
      {
        name = "markdown";
        language-servers = [
          "markdown-oxide"
        ];
      }
      {
        name = "nix";
        language-servers = [
          "nil"
        ];
      }
      {
        name = "python";
        auto-format = true;
        language-servers = [
          "basedpyright"
          "ruff"
        ];
      }
      {
        name = "qml";
        language-servers = [
          "qmlls"
        ];
      }
      {
        name = "scss";
        formatter = {
          command = lib.getExe pkgs.nodePackages.prettier;
          args = [
            "--parser"
            "scss"
          ];
        };
        language-servers = [
          "vscode-css-language-server"
          "tailwindcss-ls"
        ];
      }
      {
        name = "typescript";
        auto-format = true;
        formatter = biome "ts";
        language-servers = [
          "typescript-language-server"
        ];
      }
      {
        name = "typst";
        auto-format = true;
        language-servers = [ "tinymist" ];
      }
      {
        name = "java";
        auto-format = true;
        language-servers = [ "jdtls" ];
      }
    ];

    language-server = {
      basedpyright.command = "${pkgs.basedpyright}/bin/basedpyright-langserver";

      bash-language-server = {
        command = lib.getExe pkgs.bash-language-server;
        args = [ "start" ];
      };

      clangd = {
        command = "${pkgs.clang-tools}/bin/clangd";
        clangd.fallbackFlags = [ "-std=c++2b" ];
      };

      cmake-language-server = {
        command = lib.getExe pkgs.cmake-language-server;
      };

      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = [
          "${lib.getExe pkgs.nixfmt}"
          "-q"
        ];
      };

      qmlls = {
        command = "${pkgs.qt6.qtdeclarative}/bin/qmlls";
        args = [ "-E" ];
      };

      ruff = {
        command = lib.getExe pkgs.ruff;
        args = [ "server" ];
      };

      tailwindcss-ls = {
        command = lib.getExe pkgs.tailwindcss-language-server;
        args = [ "--stdio" ];
      };

      tinymist = {
        command = lib.getExe pkgs.tinymist;
        config = {
          exportPdf = "onType";
          outputPath = "$root/target/$dir/$name";
          formatterMode = "typstyle";
          formatterPrintWidth = 80;
        };
      };

      jdtls = {
        command = "${pkgs.jdt-language-server}/bin/jdtls";
        args = [
          "-data"
          "${config.home.homeDirectory}/.local/share/jdtls-workspace"
        ];
        config = {
          java = {
            signatureHelp.enabled = true;
            completion.guessMethodArguments = true;
            configuration.updateBuildConfiguration = "automatic";
            format.enabled = true;
          };
        };
        environment = {
          JAVA_HOME = pkgs.jdk21.home;
        };
      };

      typescript-language-server = {
        command = lib.getExe pkgs.nodePackages.typescript-language-server;
        args = [ "--stdio" ];
        config = {
          typescript-language-server.source = {
            addMissingImports.ts = true;
            fixAll.ts = true;
            organizeImports.ts = true;
            removeUnusedImports.ts = true;
            sortImports.ts = true;
          };
          plugins = [
            {
              name = "@vue/typescript-plugin";
              location = "${pkgs.vue-language-server}/lib/node_modules/@vue/language-server";
              languages = [ "vue" ];
            }
          ];
        };
      };

      vscode-css-language-server = {
        command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-css-language-server";
        args = [ "--stdio" ];
        config = {
          provideFormatter = true;
          css.validate.enable = true;
          scss.validate.enable = true;
        };
      };
    };
  };

  home.file.".dprint.json".source = builtins.toFile "dprint.json" (
    builtins.toJSON {
      lineWidth = 80;
      plugins = [
        "https://plugins.dprint.dev/markdown-0.17.8.wasm"
      ];
    }
  );
}
