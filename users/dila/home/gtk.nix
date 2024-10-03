{ config, pkgs, lib, home-manager, ... }: {

  gtk = {
    enable = true;

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };

    font = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell";
      size = 8;
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

}
