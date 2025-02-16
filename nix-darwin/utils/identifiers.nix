{ inputs, ... }:
let
  env = import ../env.nix;
  inherit (inputs.nixpkgs) lib;
in
{
  username = env.username;
}