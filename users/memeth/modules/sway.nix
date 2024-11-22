{ config, pkgs, lib, ... }:


let
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
  dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway XDG_SESSION_TYPE=wayland XDG_SESSION_DESKTOP=sway QT_QPA_PLATFORM=wayland-egl QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
  systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      '';
  };

in

{

  # enable sway window manager
  programs.sway = {
    enable = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
      dbus-sway-environment
      swayidle
    ];
    wrapperFeatures = {
      gtk = true;
      base = true;
    };
  };


}
