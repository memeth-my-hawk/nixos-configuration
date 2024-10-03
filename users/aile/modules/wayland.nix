{ config, pkgs, lib, ...}:

# General, compositor-agnostic configuration for wayland compositors that I use, such as Sway and Hyprland.  

{

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  xdg.mime.enable = true;

  # These pkgs are meant to be used in any wayland compositor that I have.
  environment.systemPackages = with pkgs; [
    xdg-utils
    glib
    grim
    slurp
    dunst
    gammastep
    clipman
    wdisplays
    foot
    wev
    brightnessctl
    alacritty
    wayland
    fuzzel
    kitty
    polkit_gnome
    polkit
    mesa
    swaylock
    mimeo
    yambar
    feh
    networkmanagerapplet
    trash-cli
    libsForQt5.qt5.qtwayland
  ];



  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.dbus.enable = true;
  services.geoclue2.enable = true;
  programs.nm-applet.enable = true;
  #programs.dconf.enable = true;
  services.tumbler.enable = true;

  

}
