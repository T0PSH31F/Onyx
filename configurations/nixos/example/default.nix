# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.default
    self.nixosModules.gui
    ./configuration.nix
  ];

  # Enable home-manager for "t0psh31f" user
  home-manager.users."t0psh31f" = {
    imports = [ (self + /configurations/home/t0psh31f.nix) ];
  };
}
