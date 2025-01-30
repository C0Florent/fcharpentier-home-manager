{ pkgs, ... }:

let
  delta = "${pkgs.delta}/bin/delta";
  wl-paste = "${pkgs.wl-clipboard}/bin/wl-paste";
in

pkgs.writeShellScriptBin "differ" ''
    cd /tmp

    echo -ne "Put \e[31mactual\e[0m output in clipboard and press enter..."
    read
    ${wl-paste} > actual
    echo -e "\e[3;37m copied!\e[0m"

    echo -ne "Put \e[32mexpected\e[0m output in clipboard and press enter..."
    read
    ${wl-paste} > expected
    echo -e "\e[3;37m copied!\e[0m"

    ${delta} actual expected
''
