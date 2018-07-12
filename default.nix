with import <nixpkgs> {};

stdenvNoCC.mkDerivation {
  name = "rebar32nix";
  src = lib.cleanSource ./.;

  buildInputs = [ erlang ];
  installPhase = "install -Dt $out/bin rebar32nix";
}
