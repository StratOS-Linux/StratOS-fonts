{
  description = "StratOS custom fonts as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      # import nixpkgs with unfree allowed *inside this flake only*
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
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
          license = licenses.unfree; # stays marked unfree
          free = false;              # marks it as non-free explicitly
          maintainers = [ "zstg" ];
          platforms = platforms.all;
        };
      };
    };
}
