{ bootFetchgit ? (import <nixpkgs> {}).fetchgit }:
let
  pkgs = import (bootFetchgit (import ./version.nix)) {};
  inherit (pkgs) stdenv rebar3;

  appRoot = builtins.toPath ./.;
  version = "0.1.0";
in stdenv.mkDerivation {
  inherit version;
  name = "rebarlock2nix-${version}";

  builtInputs = with pkgs; [ rebar3 erlang ];
}
