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
      twxs.cmake
      xaver.clang-format

      dart-code.dart-code
      dart-code.flutter

      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      vadimcn.vscode-lldb

      sdras.night-owl

      tomoki1207.pdf
      streetsidesoftware.code-spell-checker

      justusadam.language-haskell
      haskell.haskell

      iliazeus.vscode-ansi

      ms-vscode.live-server
    ];

    keybindings = [
      {
        key = "ctrl+[Quote]";
        command = "terminal.focus";
        when = null;
      }
      {
        key = "ctrl+[Backquote]";
        command = "workbench.action.navigateBack";
        when = "canNavigateBack";
      }
      {
        key = "ctrl+alt+M";
        command = "workbench.action.terminal.sendSequence";
        args.text = "make\n";
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
      "workbench.colorCustomizations" = let
        # Provided by https://github.com/sdras/night-owl-vscode-theme?tab=readme-ov-file#separate-the-editor-from-the-sidebar,
        # patched to preference
        activateSideBar = builtins.fromJSON ''
          {
            "activityBar.border": "#102a44",
            "editorGroup.border": "#102a44",
            "sideBar.border": "#102a44"
          }
        ''; in {
          "[Night Owl]" = activateSideBar;
          "[Night Owl (No Italics)]" = activateSideBar;
      };

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
      "cSpell.userWords" = [ "Epitech" ];

      "haskell.manageHLS" = "PATH";
      "haskell.serverExecutablePath" = "haskell-language-server-wrapper";
    };
  };
}
