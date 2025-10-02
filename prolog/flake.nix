{
  description = "A flake for SWI-Prolog with enhanced shell experience";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    swipl-nix.url = "github:matko/swipl-nix";
  };

  outputs = {
    self,
    nixpkgs,
    swipl-nix,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };

    # Use an existing SWI-Prolog version package from swipl-nix
    swipl = swipl-nix.packages.${system}."8_5_7"; # valid version
  in {
    devShells.${system}.default = pkgs.mkShell {
      name = "swipl-shell";

      buildInputs = [
        swipl
        pkgs.bashInteractive
        pkgs.gnumake
        pkgs.gcc
        pkgs.git
        pkgs.readline
      ];

      shellHook = ''
        export PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w \[\e[0m\]\$ "
        alias swipl="swipl -q --set_prolog_flag(readline, true)"
        echo "Welcome to SWI-Prolog shell environment"
      '';
    };
  };
}
