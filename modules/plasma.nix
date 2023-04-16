{ config, lib, pkgs, ...}:

{
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  
  environment.systemPackages = with pkgs; [
    plasma-pa
    bluedevil
    yakuake
    kate
    ark
    arc-kde-theme
    polkit-kde-agent
  ];

  programs.partition-manager.enable = true;
}

