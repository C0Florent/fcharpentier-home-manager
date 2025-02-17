{ pkgs, lib, config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bind = let
      # Int -> String
      workspace = id: "$mainMod, code:${builtins.toString (9 + id)}, workspace, r~${builtins.toString id}";
    in map workspace (lib.range 1 12);
  };
}
