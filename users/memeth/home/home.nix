{ config, pkgs, lib, home-manager, ... }: {

  imports = [
    ./nnn.nix
    ./gtk.nix
    ./waybar.nix
  ];


}
