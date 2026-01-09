{lib, ...}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "[](green)"
        "$os"
        "$username"
        "[](bg:yellow fg:green)"
        "$directory"
        "[](fg:yellow bg:cyan)"
        "$git_branch"
        "$git_status"
        "[](fg:cyan bg:blue)"
        "$c"
        "$cpp"
        "$rust"
        "$golang"
        "$nodejs"
        "$php"
        "$java"
        "$kotlin"
        "$haskell"
        "$python"
        "[](fg:blue bg:bright-black)"
        "$docker_context"
        "$conda"
        "$pixi"
        "[](fg:bright-black bg:black)"
        "$time"
        "[ ](fg:black)"
        "$line_break"
        "$character"
      ];

      os = {
        disabled = false;
        style = "bg:green fg:black";
        symbols = {
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          EndeavourOS = "";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          Pop = "";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:green fg:black";
        style_root = "bg:green fg:black";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "fg:black bg:yellow";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:cyan";
        format = "[[ $symbol $branch ](fg:black bg:cyan)]($style)";
      };

      git_status = {
        style = "bg:cyan";
        format = "[[($all_status$ahead_behind )](fg:black bg:cyan)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:blue";
        format = "[[ $symbol( $version) ](fg:black bg:blue)]($style)";
      };

      c = {
        symbol = " ";
        style = "bg:blue";
        format = "[[ $symbol( $version) ](fg:black bg:blue)]($style)";
      };

      cpp = {
        symbol = " ";
        style = "bg:blue";
        format = "[[ $symbol( $version) ](fg:black bg:blue)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:blue";
        format = "[[ $symbol( $version) ](fg:black bg:blue)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:blue";
        format = "[[ $symbol( $version) ](fg:black bg:blue)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:blue";
        format = "[[ $symbol( $version) ](fg:black bg:blue)]($style)";
      };

      java = {
        symbol = "";
        style = "bg:blue";
        format = "[[ $symbol( $version) ](fg:black bg:blue)]($style)";
      };

      kotlin = {
        symbol = "";
        style = "bg:blue";
        format = "[[ $symbol( $version) ](fg:black bg:blue)]($style)";
      };

      haskell = {
        symbol = "";
        style = "bg:blue";
        format = "[[ $symbol( $version) ](fg:black bg:blue)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:blue";
        format = "[[ $symbol( $version) ](fg:black bg:blue)]($style)";
      };

      docker_context = {
        symbol = "";
        style = "bg:bright-black";
        format = "[[ $symbol( $context) ](fg:#83a598 bg:bright-black)]($style)";
      };

      conda = {
        style = "bg:bright-black";
        format = "[[ $symbol( $environment) ](fg:#83a598 bg:bright-black)]($style)";
      };

      pixi = {
        style = "bg:bright-black";
        format = "[[ $symbol( $version)( $environment) ](fg:black bg:bright-black)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:black";
        format = "[[  $time ](fg:white bg:black)]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:green)";
        error_symbol = "[](bold fg:red)";
        vimcmd_symbol = "[](bold fg:green)";
        vimcmd_replace_one_symbol = "[](bold fg:purple)";
        vimcmd_replace_symbol = "[](bold fg:purple)";
        vimcmd_visual_symbol = "[](bold fg:yellow)";
      };
    };
  };
}
