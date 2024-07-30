{ config, pkgs, lib, home-manager, ... }: {


  qt = {

    enable = true;
    platformTheme.name = "kde";
    style = {
      name = "breeze";
      package = pkgs.arc-kde-theme;
    };
  
  };
  
}
