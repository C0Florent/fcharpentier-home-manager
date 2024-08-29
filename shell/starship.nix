{ lib, ... }:

let 
  style_str = { bg, fg }: "bg:${bg} fg:${fg}";
  inv_style_str = { bg, fg }: "bg:${fg} fg:${bg}";

  prompt_ok = "bright-green";
  prompt_ko = { bg ="bright-red"; fg = "white"; };
  directory = { bg = "blue"; fg = "bold bright-white"; };
  directory_lock = { bg = directory.bg; fg = "bold bright-yellow"; };
  username = { bg = "bright-white"; fg = "black"; };
  username_root = { bg = username.bg; fg = "bold dimmed red"; };
  shlvl = { bg = directory.bg; fg = "purple"; };
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      add_newline = true;

      format = lib.concatStrings [
        "[](${directory.bg})"
        "[ ](${style_str directory})"
        "$username"
        "$directory"
        "[](${directory.bg})"

        "$line_break"

        "[](${directory.bg})"
        "[ ](bg:${directory.bg})"
        "$shlvl"
        "[](fg:${directory.bg} bg:bright-green)"
        "[     ](bg:bright-green)"
        "[ ](fg:bright-green)"
      ];

     shlvl = {
        disabled = false;
        repeat = true;
        threshold = 1;
        symbol = "[](${inv_style_str shlvl})[](${style_str shlvl})";
        format = "[$symbol]($style)";
        style = style_str directory;
      };
      username = {
        show_always = true;
        style_user = style_str username;
        style_root = style_str username_root;
        format = lib.concatStrings [
          "[](fg:${username.bg} bg:${directory.bg})"
          "[ ( $user) ]($style)"
          "[ ](fg:${username.bg} bg:${directory.bg})"
        ];
        aliases = { "fcharpentier" = ""; };
      };
      directory = {
        truncation_symbol = "…/";
        truncation_length = 2;
        style = style_str directory;
        read_only_style = style_str directory_lock;
        read_only = " ";
        format = "[ [$read_only]($read_only_style)$path]($style)";
      };
      git_branch = {
        style = "blue";
        format = "[$branch]($style)";
      };
      git_state = {
        style = "blue";
        format = "[|$state($progress_current/$progress_total)]($style)";
      };
      status = {
        disabled = false;
        format = "[$status]($style)";
        style = "bold red";
      };
   };
  };
}
