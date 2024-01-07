{ config, pkgs, lib, ... }:

let
  dbus-wayfire-environment = pkgs.writeTextFile {
    name = "dbus-wayfire-environment";
    destination = "/bin/dbus-wayfire-environment";
    executable = true;

    text = ''
  dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wayfire XDG_SESSION_TYPE=wayland XDG_SESSION_DESKTOP=wayfire QT_QPA_PLATFORM=wayland-egl QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
  systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      '';
  };

in

{

  programs.wayfire = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    dbus-wayfire-environment
  ];

  services.blueman.enable = true;
  programs.file-roller.enable = true;

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "wayfire";
        user = "dila";
      };
      default_session = initial_session;
    };
  };






  

}
