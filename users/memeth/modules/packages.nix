{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  users.users.memeth.packages =
  
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
      killall
      signal-desktop
      parted
      droidcam
      protonvpn-gui
      joplin-desktop
      vesktop
      openssl
      spotify
      google-chrome
      vlc
      arc-theme
      papirus-icon-theme
      bibata-cursors
      teams-for-linux
      shotcut
      geany
    ];

    programs = {
      firefox = {
        enable = true;
      };

      wireshark = {
        enable = true;
        package = pkgs.wireshark-qt;
      };
    };




}
