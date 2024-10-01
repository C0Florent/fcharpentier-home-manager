{ pkgs, ... }:

{
  programs.vscode = {
    package = pkgs.vscodium;
    enable = true;
    mutableExtensionsDir = false;

    extensions = with pkgs.vscode-extensions; [
      vscode-icons-team.vscode-icons
      eamodio.gitlens
      mhutchie.git-graph

      bbenoist.nix
      brettm12345.nixfmt-vscode

      llvm-vs-code-extensions.vscode-clangd
      xaver.clang-format

      dart-code.dart-code
      dart-code.flutter

      rust-lang.rust-analyzer
      tamasfe.even-better-toml

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
      "git.openRepositoryInParentFolders" = "always";

      "terminal.integrated.fontFamily" = "MartianMono Nerd Font";
      "terminal.integrated.fontSize" = 12;
      "terminal.integrated.tabs.focusMode" = "singleClick";

      "terminal.integrated.shellIntegration.enabled" = false;

      "workbench.colorTheme" = "Night Owl (No Italics)";
      "workbench.iconTheme" = "vscode-icons";

      "[dart]" = {
        "editor.formatOnSave" = true;
        "editor.formatOnType" = false;

        "editor.rulers" = [ 80 ];
        "editor.selectionHighlight" = false;
        "editor.tabCompletion" = "onlySnippets";
        "editor.wordBasedSuggestions" = "off";
      };
      "editor.hover.delay" = 500;
      "editor.minimap.renderCharacters" = false;
      "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
      "[makefile]"."editor.tabSize" = 8;
      "editor.inlayHints.fontSize" = 12;
    };
  };
}
