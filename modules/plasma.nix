{ config, lib, pkgs, ...}:

{
  services.xserver.desktopManager.plasma6.enable = true;
  services.xserver.desktopManager.plasma6.enableQt5Integration = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  
  services.xserver.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
        Font = "Cantarell";
      };
    };
  };

  
  environment.systemPackages = with pkgs.kdePackages; [
    plasma-pa
    bluedevil
    yakuake
    ark
    kcmutils
    flatpak-kcm
    sddm-kcm
    ktorrent
    ksystemlog
    kamoso
  ];

  programs.dconf.enable = true;
  programs.kdeconnect.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    discover
  ];

  programs.partition-manager.enable = true;


  #environment.sessionVariables = rec {
  #  MOZ_ENABLE_WAYLAND = "1 firefox";
  #};


  xdg.portal = {
    enable = true;
  };

  services.power-profiles-daemon.enable = false;

}

