{ pkgs, ... }:

let
  opencode-latest = pkgs.stdenv.mkDerivation rec {
    pname = "opencode";
    version = "0.14.0";  # Try this version instead

    src = pkgs.fetchurl {
      url = "https://github.com/sst/opencode/releases/download/v${version}/opencode-linux-x64.zip";
      sha256 = "sha256-WfT1XY/LSdCmInOgp4cdSE3rXBbukWTMl7rV8iTtUjY=";  # Let Nix tell us the hash
    };

    nativeBuildInputs = with pkgs; [ 
      unzip 
      makeWrapper 
      autoPatchelfHook
    ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin
      cp opencode $out/bin/
      chmod +x $out/bin/opencode

      runHook postInstall
    '';

    postFixup = ''
      wrapProgram $out/bin/opencode \
        --prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}"
    '';

    meta = with pkgs.lib; {
      description = "AI coding agent built for the terminal";
      homepage = "https://github.com/sst/opencode";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
      mainProgram = "opencode";
    };
  };
in
{
  home.packages = [ opencode-latest ];
}
