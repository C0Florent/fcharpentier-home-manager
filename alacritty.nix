{
  programs.alacritty.enable = true;

  programs.alacritty.settings = {
    live_config_reload = false;

    bell = {
      animation = "EaseOutExpo";
      duration = 100;
    };

    colors = {
      draw_bold_text_with_bright_colors = true;
      primary = {
        background = "0x030215";
        foreground = "0xeff0eb";
      };
      normal = {
        black   = "0x000000";
        red     = "0x800000";
        green   = "0x008000";
        yellow  = "0x808000";
        blue    = "0x000080";
        magenta = "0x800080";
        cyan    = "0x008080";
        white   = "0xc0c0c0";
      };
      bright = {
        black   = "0x808080";
        red     = "0xff0000";
        green   = "0x00ff00";
        yellow  = "0xffff00";
        blue    = "0x0000ff";
        magenta = "0xff00ff";
        cyan    = "0x00ffff";
        white   = "0xffffff";
     };
      cursor = {
        background = "0x008ec4";
        foreground = "0xf1f1f1";
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
        family = "MartianMono Nerd Font";
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
        lines = 24;
      };
      padding = {
        x = 0;
        y = 0;
      };
    };
  };
}
