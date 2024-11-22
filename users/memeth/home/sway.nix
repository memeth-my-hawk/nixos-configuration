{ config, pkgs, lib, home-manager, ... }: {

  wayland.windowManager.sway = {

    enable = true;
    
    wrapperFeatures = {
      gtk = true;
      base = true;
    };

    xwayland = true;


  
  };

}
