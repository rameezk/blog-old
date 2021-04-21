let 
  pkgs = import <nixpkgs> {};

  nodejs-8_x = (import (pkgs.fetchzip {
    url = "https://github.com/nixos/nixpkgs/archive/c1e3414044cc623e68bb26fe94bf504b46b0ac26.zip";
          # Please update this hash with the one nix says on the first build attempt
          sha256 = "14v9kam5la8avsw9ync0iqw2jga7ijfqbvrbpnjkzb0zarjpqm9i";
        }) { }).nodejs-8_x;

in pkgs.mkShell rec {
  name = "blog";

  buildInputs = with pkgs; [
    nodejs-8_x
    (yarn.override { nodejs = nodejs-8_x; })
  ];
}
