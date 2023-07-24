{ config, lib, pkgs, ...}:

{
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm = {
    enable = true;
    settings = {
      Theme = {
        CursorTheme = "Breeze";
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
    arc-kde-theme
    polkit-kde-agent
    libsForQt5.kcmutils
    libsForQt5.flatpak-kcm
    libsForQt5.sddm-kcm
  ];

  programs.dconf.enable = true;

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    discover
  ];

  programs.partition-manager.enable = true;
  #services.power-profiles-daemon.enable = false;
}

