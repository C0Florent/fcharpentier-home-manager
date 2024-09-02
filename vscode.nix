{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    extensions = with pkgs.vscode-extensions; [
      emmanuelbeziat.vscode-great-icons

      bbenoist.nix
      dart-code.dart-code
      dart-code.flutter

      sdras.night-owl
    ];

    keybindings = [
      {
        key = "ctrl+[Quote]";
        command = "terminal.focus";
        when = null;
      }
    ];

    userSettings = {
      "terminal.integrated.fontFamily" = "MartianMono Nerd Font";
      "terminal.integrated.fontSize" = 12;
      "terminal.integrated.tabs.focusMode" = "singleClick";

      "terminal.integrated.shellIntegration.enabled" = false;

      "workbench.colorTheme" = "Night Owl (No Italics)";
    };
  };
}
