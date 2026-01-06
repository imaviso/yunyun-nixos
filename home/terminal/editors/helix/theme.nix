{
  programs.helix = {
    themes = {
      minimal =
        let
          transparent = "none";
          gray = "#737373";
          light-gray = "#a3a3a3";
          dark-gray = "#404040";
          white = "#e5e5e5";
          black = "#0a0a0a";
          red = "#ef4444";
          green = "#22c55e";
          yellow = "#eab308";
          orange = "#f97316";
          blue = "#3b82f6";
          magenta = "#d946ef";
          cyan = "#06b6d4";
        in
        {
          # UI Base
          "ui.background" = { bg = black; };
          "ui.text" = { fg = white; };
          "ui.text.focus" = { fg = white; modifiers = [ "bold" ]; };

          # Cursor
          "ui.cursor" = { modifiers = [ "reversed" ]; };
          "ui.cursor.primary" = { modifiers = [ "reversed" ]; };
          "ui.cursor.match" = { fg = yellow; modifiers = [ "underlined" ]; };
          "ui.cursorline.primary" = { bg = dark-gray; };

          # Selection
          "ui.selection" = { bg = dark-gray; };
          "ui.selection.primary" = { bg = blue; };

          # Line numbers
          "ui.linenr" = { fg = gray; bg = black; };
          "ui.linenr.selected" = { fg = white; bg = black; modifiers = [ "bold" ]; };
          "ui.gutter" = { bg = black; };

          # Statusline
          "ui.statusline" = { fg = white; bg = dark-gray; };
          "ui.statusline.inactive" = { fg = gray; bg = black; };
          "ui.statusline.normal" = { fg = black; bg = blue; modifiers = [ "bold" ]; };
          "ui.statusline.insert" = { fg = black; bg = green; modifiers = [ "bold" ]; };
          "ui.statusline.select" = { fg = black; bg = magenta; modifiers = [ "bold" ]; };

          # Menus and popups
          "ui.menu" = { fg = white; bg = dark-gray; };
          "ui.menu.selected" = { fg = black; bg = blue; };
          "ui.menu.scroll" = { fg = gray; bg = dark-gray; };
          "ui.popup" = { fg = white; bg = dark-gray; };
          "ui.popup.info" = { fg = white; bg = dark-gray; };
          "ui.help" = { fg = white; bg = dark-gray; };
          "ui.window" = { fg = gray; };

          # Virtual elements
          "ui.virtual" = { fg = dark-gray; };
          "ui.virtual.indent-guide" = { fg = dark-gray; };
          "ui.virtual.whitespace" = { fg = dark-gray; };
          "ui.virtual.ruler" = { bg = dark-gray; };
          "ui.virtual.inlay-hint" = { fg = gray; };

          # Syntax - Comments
          "comment" = { fg = gray; modifiers = [ "italic" ]; };

          # Syntax - Variables
          "variable" = { fg = white; };
          "variable.builtin" = { fg = orange; };
          "variable.parameter" = { fg = white; modifiers = [ "italic" ]; };
          "variable.other.member" = { fg = light-gray; };

          # Syntax - Constants
          "constant" = { fg = orange; };
          "constant.numeric" = { fg = orange; };
          "constant.character" = { fg = orange; };
          "constant.character.escape" = { fg = cyan; };
          "constant.builtin" = { fg = orange; };

          # Syntax - Strings
          "string" = { fg = green; };
          "string.regexp" = { fg = cyan; };
          "string.special" = { fg = cyan; };

          # Syntax - Types
          "type" = { fg = yellow; };
          "type.builtin" = { fg = yellow; };
          "type.enum.variant" = { fg = orange; };
          "attribute" = { fg = yellow; };

          # Syntax - Functions
          "function" = { fg = blue; };
          "function.builtin" = { fg = blue; };
          "function.macro" = { fg = cyan; };
          "function.method" = { fg = blue; };
          "constructor" = { fg = yellow; };

          # Syntax - Keywords
          "keyword" = { fg = magenta; };
          "keyword.control" = { fg = magenta; };
          "keyword.control.return" = { fg = magenta; };
          "keyword.control.exception" = { fg = magenta; };
          "keyword.operator" = { fg = magenta; };
          "keyword.directive" = { fg = magenta; };
          "keyword.function" = { fg = magenta; };
          "keyword.storage" = { fg = magenta; };

          # Syntax - Operators and punctuation
          "operator" = { fg = light-gray; };
          "punctuation" = { fg = light-gray; };
          "punctuation.bracket" = { fg = light-gray; };
          "punctuation.delimiter" = { fg = light-gray; };
          "punctuation.special" = { fg = cyan; };

          # Syntax - Other
          "label" = { fg = magenta; };
          "namespace" = { fg = blue; };
          "special" = { fg = cyan; };
          "tag" = { fg = magenta; };

          # Markup
          "markup.heading" = { fg = blue; modifiers = [ "bold" ]; };
          "markup.list" = { fg = magenta; };
          "markup.bold" = { modifiers = [ "bold" ]; };
          "markup.italic" = { modifiers = [ "italic" ]; };
          "markup.strikethrough" = { modifiers = [ "crossed_out" ]; };
          "markup.link.url" = { fg = cyan; modifiers = [ "underlined" ]; };
          "markup.link.text" = { fg = blue; };
          "markup.quote" = { fg = gray; modifiers = [ "italic" ]; };
          "markup.raw" = { fg = green; };

          # Diff
          "diff.plus" = { fg = green; };
          "diff.delta" = { fg = yellow; };
          "diff.minus" = { fg = red; };

          # Diagnostics
          "diagnostic" = { modifiers = [ "underlined" ]; };
          "diagnostic.hint" = { underline = { style = "curl"; color = gray; }; };
          "diagnostic.info" = { underline = { style = "curl"; color = blue; }; };
          "diagnostic.warning" = { underline = { style = "curl"; color = yellow; }; };
          "diagnostic.error" = { underline = { style = "curl"; color = red; }; };

          "info" = { fg = blue; };
          "hint" = { fg = gray; };
          "debug" = { fg = gray; };
          "warning" = { fg = yellow; };
          "error" = { fg = red; };
        };
    };
  };
}
