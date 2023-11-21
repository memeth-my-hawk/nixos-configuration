{ config, lib, pkgs, ...}:

{
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  services.xserver.displayManager.sddm = {
    enable = true;
    settings = {
      Theme = {
        CursorTheme = "breeze_cursors";
        Font = "Cantarell";
      };
    };
  };

  
  environment.systemPackages = with pkgs; [
    plasma-pa
    bluedevil
    yakuake
    kate
    ark
    libsForQt5.kcmutils
    libsForQt5.flatpak-kcm
    libsForQt5.sddm-kcm
    ktorrent
    ksystemlog
    libsForQt5.kamoso
  ];

  programs.dconf.enable = true;
  programs.kdeconnect.enable = true;

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
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
}

