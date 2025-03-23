{ pkgs, lib, config, ... }:

let
  workspaces = lib.range 1 12;

  # ((a -> b) -> [a] -> c) -> (KEY -> WORKSPACE -> b) -> c
  traverse-workspaces = mapFunc: f: mapFunc (w: f "code:${builtins.toString (9 + w)}" "r~${builtins.toString w}") workspaces;

  # (KEY -> WORKSPACE -> a) -> [a]
  map-workspaces = traverse-workspaces map;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = map-workspaces (key: ws:
      "$mainMod, ${key}, workspace, ${ws}"
    );
  };
}
