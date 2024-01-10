{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

   nix.settings.experimental-features = [ "nix-command" "flakes" ];


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
      git
      mlocate
      lm_sensors
      smartmontools
      dmidecode
      ntfs3g
      acpi
      android-file-transfer
      usbutils
      zip
      unzip
      shared-mime-info
      mimeo
      tree
      rar
      fwupd
      pciutils
      ffmpeg
      killall
      whatsapp-for-linux
    ];


}
