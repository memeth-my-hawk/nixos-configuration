{config, pkgs, lib, ... }:

{

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;

  };
  services.xserver.desktopManager.gnome.enable = true;
  services.power-profiles-daemon.enable = false;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gedit
    gnome-connections
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gnome-system-monitor
    gnome-font-viewer
    gnome-disk-utility
    gnome-calculator
    gnome-maps
    gnome-clocks
    gnome-contacts
    gnome-calendar
    gnome-weather
    gnome-keyring
    yelp
    epiphany # web browser
    geary # email reader
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  programs.evince.enable = true;

  hardware.pulseaudio.enable = false;

}
