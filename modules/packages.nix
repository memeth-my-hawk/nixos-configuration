{ config, lib, pkgs, ... }:


{
  nixpkgs.config.allowUnfree = true;


  environment.systemPackages =
  
    with pkgs; [
      wget
      neofetch
      firefox-wayland
      htop
      zoom-us
      libreoffice
      microcodeIntel
      linuxHeaders
      asciiquarium
      cmatrix
      figlet
      lolcat
      git
      mlocate
      lm_sensors
      smartmontools
      dmidecode
      ntfs3g
      w3m
      acpi
      android-file-transfer
      usbutils
      zip
      unzip
      shared-mime-info
      mimeo
      tree
      rar
      vlc
      fwupd
      pciutils
      ffmpeg
    ];


}
