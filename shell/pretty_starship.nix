{ lib, config, ... }:

let 
  style_str = { bg, fg }: "bg:${bg} fg:${fg}";
  inv_style_str = { bg, fg }: "bg:${fg} fg:${bg}";

  # Definition of module colours
  m_username = { bg = "bright-white"; fg = "black"; };
  m_username_root = { bg = m_username.bg; fg = "bold dimmed red"; };
  m_directory = { bg = "blue"; fg = "bold bright-black"; };
  m_directory_lock = { bg = m_directory.bg; fg = "bold bright-yellow"; };
  m_git_branch = { bg = m_git_status.bg; fg = "bold ${m_git_status.fg}"; };
  m_git_status = { bg = "cyan"; fg = "bright-black"; };
  m_prestatus = { bg = "none"; fg = "bright-black"; };
  m_shlvl = { bg = m_prestatus.fg; fg = "purple"; };
  m_status = { bg = "dimmed red"; fg = "bold black"; };
  m_prompt_ok = { bg = "bright-green" ; fg = "white"; };
  m_prompt_ko = { bg ="bright-red"; fg = "bright-white"; };
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;

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

        "[▕](fg:${m_prestatus.fg})"
        "[ ](bg:${m_prestatus.fg})"
        "$shlvl"
        "$character"
        "$status"
        "[ ](fg:prev_bg)"
      ];

     shlvl = {
        disabled = false;
        repeat = true;
        threshold = 1;
        symbol = "[](${inv_style_str m_shlvl})[](${style_str m_shlvl})";
        format = "[$symbol]($style)";
        style = style_str m_directory;
      };
      username = {
        show_always = true;
        style_user = style_str m_username;
        style_root = style_str m_username_root;
        format = lib.concatStrings [
          "[](fg:${m_username.bg} bg:prev_bg)"
          "[ ( $user) ]($style)"
          "[ ](fg:${m_username.bg} bg:${m_directory.bg})"
        ];
        aliases = { "${config.home.username}" = ""; };
      };
      directory = {
        truncation_symbol = "…/";
        truncation_length = 2;
        style = style_str m_directory;
        read_only_style = style_str m_directory_lock;
        read_only = " ";
        format = "[ [$read_only]($read_only_style)$path]($style)";
      };
      git_branch = {
        style = style_str m_git_branch;
        symbol = " ";
        format = "[](fg:prev_bg bg:${m_git_branch.bg})[ $symbol$branch]($style)";
      };
      git_status = let
        sep = "[](${style_str m_git_status})";
        subm = symbol: "${sep} ${symbol} \${count} ";
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
        style = style_str m_git_status;

        ahead = "󰶼\${count}";
        behind = "󰶹\${count}";
        diverged = "󰶼\${ahead_count} 󰶹\${behind_count}";
        up_to_date = "";

        conflicted = "${sep}[  \${count} ](fg:bold red bg:prev_bg)";

        untracked = subm "";
        renamed = subm "󰓹";
        modified = subm "";
        staged = subm "󰝒";
        deleted = subm "";
        stashed = subm "";
      };
      git_state = {
        style = style_str m_git_branch;
        format = "[ $state(: $progress_current/$progress_total) ]($style)";
      };
      character = {
        success_symbol = "[   ](fg:${m_prestatus.fg} bg:${m_prompt_ok.bg})";
        error_symbol = "[ ](fg:${m_prestatus.fg} bg:${m_prompt_ko.bg})";
        format = "$symbol";
      };
      status = {
        disabled = false;
        format = "[$status ]($style)";
        style = style_str m_prompt_ko;
      };
    };
  };
}
