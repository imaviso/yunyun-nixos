{ pkgs ? import <nixpkgs> {} }:

stdenv.mkDerivation {
  name = "multi-scrobbler";
  src = pkgs.fetchFromGitHub {
    owner = "FoxxMD";
    repo = "multi-scrobbler";
    rev = "v0.85"; # Replace with the desired commit hash
    sha256 = "12c4a014f2e6945304fe584c4bd19599ca1f1988"; # Replace with the SHA256 hash of the repo at that commit
  };

  buildInputs = [ pkgs.nodejs pkgs.npm ];

  buildPhase = ''
    npm install
  '';

  installPhase = ''
    mkdir -p $out
    cp -r src $out/
    cp package.json $out/
    cp node_modules $out/
  '';

  meta = {
    description = "A JavaScript app to scrobble music to various services";
    homepage = https://github.com/FoxxMD/multi-scrobbler;
    license = pkgs.lib.licenses.mit;
  };
}
