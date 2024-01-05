{ config, pkgs, lib, home-manager, ... }: {

  programs.nnn = {
    extraPackages = with pkgs; [ imv kdeconnect ffmpegthumbnailer fontpreview ];
    enable = true;
    package = pkgs.nnn.override { withNerdIcons = true; };
    plugins = {
      mappings = {
        t = "nmount";
        K = "kdeconnect";
        y = "suedit";
        i = "imgview";
      };
      src = "${pkgs.nnn.src}/plugins"; # alternative: ${inputs.nnn}
    };
  };

  gtk = {
    enable = true;
    
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    font = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell";
      size = 9;
    };

    theme = {
      package = pkgs.arc-theme;
      name = "Arc-Lighter";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Light";
    };
  
  };

  programs.waybar = {
    settings = [

    ];
  };

}
