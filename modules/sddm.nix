{ config, pkgs, lib, ... }:

{
  services.xserver.displayManager.defaultSession = "wayfire";
  services.xserver.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
        Font = "Cantarell";
      };
    };
  };

}
