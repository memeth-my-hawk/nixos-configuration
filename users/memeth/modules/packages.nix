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
      ffmpeg
      killall
      signal-desktop
      element-desktop
      parted
      droidcam
      protonvpn-gui
      zathura
      mpv
      cmus
      joplin-desktop
      vesktop
      openssl
      spotify
      google-chrome
      nil
      marksman
    ];

    programs.firefox = {
      enable = true;
    };


}
