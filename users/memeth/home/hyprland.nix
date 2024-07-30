{ config, pkgs, lib, home-manager, ... }: {

  wayland.windowManager.hyprland = {

    enable = true;

    settings = {

      "$mod" = "SUPER";


    };
  
  };


}
