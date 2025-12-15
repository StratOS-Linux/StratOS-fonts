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
    in {
      packages.${system} = {
        default = pkgs.stdenv.mkDerivation {
          pname = "stratos-fonts";
          version = "1.0.4";

          src = ./.;
          nativeBuildInputs = [ pkgs.fontconfig ];
          installPhase = ''
            runHook preInstall
            mkdir -p $out/share/fonts/truetype
            cp -r usr/share/fonts/* $out/share/fonts/
            cp -r usr/share/fonts/* $out/share/fonts/truetype/ # not necessary
            runHook postInstall
          '';

          meta = with pkgs.lib; {
            description = "StratOS custom fonts";
            license = licenses.unfree;
            maintainers = [ "zstg" ];
            platforms = platforms.all;
          };
        };

        # alias
        font = self.packages.${system}.default;
      };
    };
}
