{ config, pkgs, lib, home-manager, ... }: {

  programs.nnn = {
    extraPackages = with pkgs; 
      [ 
        sxiv 
        kdeconnect 
        ffmpegthumbnailer 
        fontpreview 
      ];
    enable = true;
    package = pkgs.nnn.override { withNerdIcons = true; };
    plugins = {
      mappings = {
        D = "nmount";
        K = "kdeconnect";
        y = "suedit";
        H = "imgview";
      };
      src = pkgs.nnn + "/plugins";
    };
  };

}
