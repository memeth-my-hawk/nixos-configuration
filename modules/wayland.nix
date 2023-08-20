{ config, pkgs, lib, ...}:

# General, compositor-agnostic configuration for wayland compositors that I use, such as Sway and Hyprland.  

# GTK configuration
let

    # currently, there is some friction between sway and gtk:
  # https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
  # the suggested way to set gtk settings is with gsettings
  # for gsettings to work, we need to tell it where the schemas are
  # using the XDG_DATA_DIR environment variable
  # run at the end of sway config
  configure-gtk = pkgs.writeTextFile {
      name = "configure-gtk";
      destination = "/bin/configure-gtk";
      executable = true;
      text = let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gsettings-schemas/${schema.name}";
      in ''
        export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
        gnome_schema=org.gnome.desktop.interface
        gsettings set $gnome_schema gtk-theme 'Arc-Lighter'
        gsettings set $gnome_schema font-name 'Cantarell 9'
        gsettings set $gnome_schema monospace-font-name 'Source Code Pro 9'
        gsettings set $gnome_schema icon-theme 'Papirus-Light'
        gsettings set $gnome_schema cursor-theme 'Bibata-Modern-Classic'
        '';
  };


in

{

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
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
    #wl-clipboard
    #bemenu
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
    #egl-wayland
    mesa
    #swaylock
    mimeo
    bibata-cursors
    yambar
    configure-gtk
    feh
    networkmanagerapplet
    trash-cli
    ly
  ];


  programs.waybar = { 
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
         mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
       });
  };

  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.dbus.enable = true;
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
  services.geoclue2.enable = true;


}
