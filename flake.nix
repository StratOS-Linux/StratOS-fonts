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
          version = "unstable";

          src = ./.;

          installPhase = ''
            runHook preInstall
            mkdir -p $out/share/fonts/truetype
            cp -r usr/share/fonts/* $out/share/fonts/
            cp -r usr/share/fonts/* $out/share/fonts/truetype/
            runHook postInstall
          '';

          postFixup = ''
            fc-cache -fv $out/share/fonts
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
