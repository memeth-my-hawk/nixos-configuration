{ config, pkgs, lib, ... }:
{
  services.xserver.desktopManager.enlightenment.enable = true;
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
  services.connman.enable = true;


  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.gtkgreet}/bin/gtkgreet --cmd enlightenment_start";
        #user = "greeter";
      };
    };
  };


}
