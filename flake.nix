{
  description = "StratOS custom fonts as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      stratos-fonts = pkgs.stdenv.mkDerivation {
        pname = "stratos-fonts";
        version = "unstable";

        src = ./.;

        installPhase = ''
          runHook preInstall
          mkdir -p $out/share/fonts
          cp -r usr/share/fonts/* $out/share/fonts/
          runHook postInstall
        '';

        meta = with pkgs.lib; {
          description = "StratOS custom fonts";
          license = licenses.unfree;
          platforms = platforms.all;
        };
      };
    in {
      # Package output
      packages.${system}.default = stratos-fonts;

      # NixOS module output
      nixosModules.default = { config, lib, pkgs, ... }: {
        fonts.packages = [ stratos-fonts ];
      };
    };
}
