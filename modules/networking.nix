{ config, lib, pkgs, ... }:

{
  
  networking = {
    
    hostName = "asus"; # Define your hostname.
    networkmanager.enable = true;

    
  };

  programs.nm-applet.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;   

}
