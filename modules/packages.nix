{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

   nix.settings.experimental-features = [ "nix-command" "flakes" ];


  environment.systemPackages =
  
    with pkgs; [
      wget
      neofetch
      htop
      zoom-us
      libreoffice
      linuxHeaders
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
      tree
      rar
      pciutils
      ffmpeg
      killall
    ];

    programs.firefox = {
      enable = true;
    };


}
