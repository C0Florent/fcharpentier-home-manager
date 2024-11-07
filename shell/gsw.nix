{pkgs, ...}:

let
  fzf = "${pkgs.fzf}/bin/fzf";
  xargs = "${pkgs.toybox}/bin/xargs";
in

pkgs.writeShellScriptBin "gsw" ''
    if [ $# -ne 0 ]; then
        git switch "$@"
        exit $?
    fi
    current_branch="$(git branch --show-current)"
    if [ -z $current_branch ]; then
        exit 1;
    fi
    
    chosen_branch="$((echo "$current_branch"; git branch | grep -v "^\* $current_branch$") | ${fzf})"

    if [ -z "$chosen_branch" ]; then
        exit 1;
    fi
    
    git switch "$(${xargs} <<< "$chosen_branch")"
    exit $?
''
