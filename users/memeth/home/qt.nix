{ config, pkgs, lib, home-manager, ... }: {


  qt = {

    enable = true;
    platformTheme = "kde";
    style = {
      name = "arc-lighter";
      package = pkgs.arc-kde-theme;
    };
  
  
  };
  
}
