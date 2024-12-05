{
  description = "Home Manager configuration of fcharpentier";

  inputs = {
    # The "standard" nixpkgs which is used for modules which
    # don't need frequent updates, and are ok staying with older versions
    #
    # It might seem weird that this points to unstable, but the flake.lock
    # actually make all versions static. This should be updated to 24.11
    # when it is out.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    # The "cutting-edge" nixpkgs, used by modules that always
    # want the latest version of everything.
    nixpkgs-latest = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixpkgs-latest, nix-vscode-extensions, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-latest = nixpkgs-latest.legacyPackages.${system};
      vscode-extensions = nix-vscode-extensions.extensions.${system};
    in {
      homeConfigurations."fcharpentier" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit pkgs-latest vscode-extensions;
        };
      };
    };
}
