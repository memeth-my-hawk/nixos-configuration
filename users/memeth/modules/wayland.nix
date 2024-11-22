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
    clipman
    wdisplays
    foot
    wev
    brightnessctl
    alacritty
    fuzzel
    kitty
    mesa
    swaylock
    mimeo
    yambar
    zathura
    feh
    networkmanagerapplet
    trash-cli
  ];


  programs.xwayland.enable = true;
  programs.kdeconnect.enable = true;
  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.dbus.enable = true;
  programs.nm-applet.enable = true;
  #programs.dconf.enable = true; # no need to enable if GNOME is present.
  services.tumbler.enable = true;

  

}
