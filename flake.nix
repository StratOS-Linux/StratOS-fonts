{
  description = "StratOS custom fonts as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "stratos-fonts";
        version = "unstable";

        src = ./.;

        installPhase = ''
          mkdir -p $out/share/fonts
          cp -r usr/share/fonts/* $out/share/fonts/
        '';

        meta = with pkgs.lib; {
          description = "StratOS custom fonts";
          license = licenses.unfree;
          maintainers = [ "zstg" ];
          platforms = platforms.all;
        };
      };
    };
}
