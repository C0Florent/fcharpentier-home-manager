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
        background = "#030a0c";
        foreground = "#e6f4f6";
      };
      normal = {
        black = "#030a0c";
        red = "#e73359";
        green = "#59972d";
        yellow = "#ae7714";
        blue = "#2d83e8";
        magenta = "#ba3ce8";
        cyan = "#1a9696";
        white = "#8dc4ce";
      };
      bright = {
        black = "#33595f";
        red = "#f75b72";
        green = "#67af34";
        yellow = "#c98b1a";
        blue = "#509af6";
        magenta = "#ca64f3";
        cyan = "#1faeae";
        white = "#e6f4f6";
      };
      cursor = {
        text = "#030a0c";
        cursor = "#8dc4ce";
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
