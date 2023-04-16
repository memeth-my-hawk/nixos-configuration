{ config, pkgs, lib, ... }:

{
   # Hardware settings.
  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;
    opengl = {
      enable = true;
      driSupport = true;
    };
  };
}
