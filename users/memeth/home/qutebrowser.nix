{ config, pkgs, lib, home-manager, ... }: {

  programs.qutebrowser = {

    enable = true;

    settings = {

      colors ={
        
        statusbar = {
          normal ={
            bg = "#f2f2f2";
            fg = "#000000";
          };

          progress = {
            bg = "#5294e2";
          };

          url = {
            fg = "#31bd77";
          };
        
        };
      
      };

      fonts = {
        default_family = "Cantarell";
        default_size = "8pt";
        prompts = "default_size default_family";
      };


    
    };
  
  };

}
