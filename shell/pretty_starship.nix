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
  git_branch = { bg = git_status.bg; fg = "bold ${git_status.fg}"; };
  git_status = { bg = "cyan"; fg = "bright-white"; };
  status = { bg = "dimmed red"; fg = "bold bright-white"; };
  prestatus = { bg = "bright-black"; fg = "bright-white"; };
  shlvl = { bg = prestatus.bg; fg = "purple"; };
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      add_newline = true;

      format = lib.concatStrings [
        "$username"
        "$directory"
        "$git_branch"
        "$git_status"
        "$git_state"
        "[](fg:prev_bg bg:none)"

        "$line_break"

        "[ ](fg:${prestatus.bg})"
        "[ ](bg:${prestatus.bg})"
        "$shlvl"
        "$character"
        "$status"
        "[ ](fg:prev_bg)"
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
          "[](fg:${username.bg} bg:prev_bg)"
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
        style = style_str git_branch;
        symbol = " ";
        format = "[](fg:prev_bg bg:${git_branch.bg})[ $symbol$branch]($style)";
      };
      git_status = let
        subm = symbol: " ${symbol} \${count} ";
      in {
        format = lib.concatStrings [
          "[ "
            "$ahead_behind "
            "$conflicted"
            "$staged"
            "$renamed"
            "$modified"
            "$deleted"
            "$untracked"
            "$stashed"
          "]($style)"
        ];
        style = style_str git_status;

        ahead = "󰶼\${count}";
        behind = "󰶹\${count}";
        diverged = "󰶹\${ahead_count} 󰶼\${behind_count}";
        up_to_date = "";

        conflicted = "[\${count} ](fg:bold red bg:prev_bg)";

        untracked = subm "";
        renamed = subm "󰓹";
        modified = subm "";
        staged = subm "󰝒";
        deleted = subm "";

        stashed = subm "";
      };
      git_state = {
        style = style_str git_branch;
        format = "[ | $state(: $progress_current/$progress_total)]($style)";
      };
      character = {
        success_symbol = "[   ](fg:prev_bg bg:bright-green)";
        error_symbol = "[ ](fg:prev_bg bg:red)";
        format = "$symbol";
      };
      status = {
        disabled = false;
        format = "[$status ]($style)";
        style = "fg:bold bright-white bg:red";
      };
    };
  };
}
