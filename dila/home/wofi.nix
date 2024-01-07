{ config, pkgs, lib, home-manager, ... }: {

  programs.wofi = {

    enable = true;

    settings = {
      
      location = 7;
      show = "drun";
      prompt = "Uygulama ara...";
      allow_images = true;
      width = "60%";
      height = "80%";
      yoffset = 50;
      
    };
  
  };


}
