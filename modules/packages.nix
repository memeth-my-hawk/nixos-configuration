{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages =
  
  let
    my-python-packages = p: with p; [
      pandas
      seaborn
      matplotlib
      numpy
    ];
  in

  with pkgs;
  let
    R-with-my-packages = rWrapper.override{ packages = with rPackages; [ tidyverse prismatic ];};
    RStudio-with-my-packages = rstudioWrapper.override{ packages = with rPackages; [ tidyverse prismatic ];};
  in
  
    with pkgs; [
      wget
      neofetch
      firefox
      htop
      zoom-us
      gcc
      gnumake
      R-with-my-packages
      RStudio-with-my-packages
      julia-bin
      (pkgs.python3.withPackages my-python-packages)
      jupyter
      libreoffice-fresh
      microcodeIntel
      linuxHeaders
      nnn
      signal-desktop
      asciiquarium
      cmatrix
      figlet
      lolcat
      git
      mlocate
      element-desktop
      lm_sensors
      smartmontools
      spotdl
      ventoy-full
      dmidecode
      ntfs-3g
    ];


}
