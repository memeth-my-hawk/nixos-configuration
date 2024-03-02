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
    gnome-text-editor
    gnome-console
    gnome-connections
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gnome-system-monitor
    gnome-font-viewer
    gnome-disk-utility
    gnome-terminal
    gnome-calculator
    gnome-maps
    gnome-clocks
    gnome-contacts
    gnome-calendar
    gnome-weather
    gnome-keyring
    nautilus
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

  hardware.pulseaudio.enable = false;

}
