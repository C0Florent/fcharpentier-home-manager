{ pkgs, lib, config, ... }:

let
  workspaces = lib.range 1 12;

  # (KEY -> WORKSPACE -> String) -> [String]
  for-each-workspace = f: map (w: f "code:${builtins.toString (9 + w)}" "r~${builtins.toString w}") workspaces;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = for-each-workspace (key: ws:
      "$mainMod, ${key}, workspace, ${ws}"
    );
  };
}
