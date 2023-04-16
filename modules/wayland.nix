{ config, pkgs, lib, ...}:

# General configuration for wayland compositors that I use, such as Sway and Hyprland.  

{

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # These pkgs are meant to be used in any wayland compositor that I have.
  environment.systemPackages = with pkgs; [
    xdg-utils
    glib
    grim
    slurp
    wl-clipboard
    bemenu
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
  ];


  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
};

  programs.waybar.enable = true;
}
