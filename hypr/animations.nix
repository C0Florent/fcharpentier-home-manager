{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    animation = [
      "windows, 1, 3.5, easeOutBack, slide"
    ];

    bezier = [
      "easeOutBack, .07, 1.4, 0.4, .92"
    ];

    windowrulev2 = [
      "animation popin, onworkspace:w[tv1]"
      "animation popin, floating:1"
    ];
  };
}
