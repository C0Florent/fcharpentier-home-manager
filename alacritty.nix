{
  programs.alacritty.enable = true;

  programs.alacritty.settings = {
    live_config_reload = false;

    bell = {
      animation = "EaseOutQuart";
      duration = 10;
      color = "#444444";
    };

    colors = {
      draw_bold_text_with_bright_colors = true;
      primary = {
        background = "#0e050d";
        foreground = "#f6eef5";
      };
      normal = {
        black = "#0e050d";
        red = "#f41400";
        green = "#009e48";
        yellow = "#a17f00";
        blue = "#5674ff";
        magenta = "#d700d0";
        cyan = "#0095a7";
        white = "#d1abcc";
      };
      bright = {
        black = "#694269";
        red = "#ff5743";
        green = "#00b754";
        yellow = "#ba9400";
        blue = "#7190ff";
        magenta = "#f700f0";
        cyan = "#00acc1";
        white = "#f6eef5";
      };
      cursor = {
        text = "#0e050d";
        cursor = "#d1abcc";
      };
    };

    cursor = {
      style = "Block";
      unfocused_hollow = true;
    };

    debug = {
      render_timer = false;
    };

    font = {
      size = 11;
      normal = {
        family = "FiraCode Nerd Font";
      };
    };

    mouse = {
      bindings = [
        {
          action = "PasteSelection";
          mouse = "Middle";
        }
      ];
    };

    scrolling = {
      history = 15000;
      multiplier = 3;
    };

    selection = {
      save_to_clipboard = false;
      semantic_escape_chars = ",│`|:\"' ()[]{}<>";
    };

    window = {
      decorations = "Full";
      dynamic_title = true;
      opacity = 0.98;
      startup_mode = "Windowed";
      resize_increments = true;
      dimensions = {
        columns = 80;
        lines = 30;
      };
      padding = {
        x = 0;
        y = 0;
      };
    };
  };
}
