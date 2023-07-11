{config, pkgs, lib, ... }:

{

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;

  };
  services.xserver.desktopManager.gnome.enable = true;
  services.power-profiles-daemon.enable = false;

}
