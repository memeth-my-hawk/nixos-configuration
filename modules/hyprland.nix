{ config, pkgs, lib, ...}:



let
  # bash script to let dbus know about important env variables and
  # propagate them to relevent services run at the end of sway config
  # see
  # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/"It-doesn't-work"-Troubleshooting-Checklist
  # note: this is pretty much the same as  /etc/sway/config.d/nixos.conf but also restarts
  # some user services to make sure they have the correct environment variables
  dbus-hypr-environment = pkgs.writeTextFile {
    name = "dbus-hypr-environment";
    destination = "/bin/dbus-hypr-environment";
    executable = true;

    text = ''
  dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland XDG_SESSION_TYPE=wayland XDG_SESSION_DESKTOP=Hyprland
  systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-hyprland
  systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-hyprland
      '';
  };

in

{
  programs.hyprland = {
    enable = true;
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];


  environment.systemPackages = with pkgs; [
    hyprland-protocols
    dbus-hypr-environment
    hyprpaper
  ];


}
