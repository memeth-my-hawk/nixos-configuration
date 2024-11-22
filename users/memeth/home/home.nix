{ config, pkgs, lib, home-manager, ... }: {

  imports = [
    ./nnn.nix
    ./gtk.nix
    ./waybar.nix
    ./qutebrowser.nix
    ./xdg.nix
    ./bash.nix
    ./git.nix
    ./hyprland.nix
    #./plasma.nix
    #./kate.nix
    #./konsole.nix
    #./qt.nix
  ];


}
