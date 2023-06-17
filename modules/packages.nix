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
      ntfs3g
      papirus-icon-theme
      arc-theme
      cmus
      ncmpcpp
      ranger
      lf
      w3m
      mpv
      acpi
      pandoc
      texlive.combined.scheme-small
      zathura
      parted
      android-file-transfer
      jmtpfs
      droidcam
      protonvpn-cli
      usbutils
      irssi
      zip
      unzip
      shared-mime-info
      mimeo
      feh
      networkmanagerapplet
      trash-cli
      tree

    ];


}
