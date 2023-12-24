{ config, lib, pkgs, ...}:

{
  services.xserver.desktopManager.enlightenment.enable = true;
  services.xserver.enable = true;
  services.xserver.layout = "tr";


  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.gtkgreet}/bin/gtkgreet --cmd enlightenment_start";
        user = "greeter";
      };

      initial_session = {
        command = "${pkgs.greetd.gtkgreet}/bin/gtkgreet --cmd enlightenment_start";
        user = "dila";
      };

    };
  };

}
