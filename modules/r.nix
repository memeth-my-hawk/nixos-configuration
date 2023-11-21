{ config, lib, pkgs, ... }:

{

  environment.systemPackages =
  
  with pkgs;
  let
    R-with-my-packages = rWrapper.override{ packages = with rPackages; [ tidyverse prismatic quarto ];};
    RStudio-with-my-packages = rstudioWrapper.override{ packages = with rPackages; [ tidyverse prismatic quarto ];};
  in
    
    with pkgs; [
      R-with-my-packages
      RStudio-with-my-packages
    ];

}
