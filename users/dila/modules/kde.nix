{ config, lib, pkgs, ...}:

{
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.plasma6.enableQt5Integration = true;
  services.displayManager.defaultSession = "plasma";
  
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Classic";
        Font = "Cantarell";
      };
    };
  };

  
  environment.systemPackages = with pkgs; [
    kdePackages.plasma-pa
    kdePackages.bluedevil
    kdePackages.ark
    kdePackages.kcmutils
    kdePackages.flatpak-kcm
    kdePackages.sddm-kcm
  ];

  programs.dconf.enable = true;

  programs.kdeconnect.enable = true;
  

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    discover
    kwallet
    kwalletmanager
  ];

  programs.partition-manager.enable = true;


  #environment.sessionVariables = rec {
  #  MOZ_ENABLE_WAYLAND = "1 firefox";
  #};


  #xdg.portal = {
  #  enable = true;
  #};

  services.power-profiles-daemon.enable = false; #because i have tlp set up, which is more effective and flexible.

}

