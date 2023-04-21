{ config, lib, pkgs, ... }:

{
  
  #systemd.network = {
  #  enable = true;
  #};


  networking = {
    
   # dhcpcd = {
   #   enable = false;
   # };
    
    hostName = "asus"; # Define your hostname.
    
    wireless = {
      enable = true;
      networks = {

        memeth-0 = {
          pskRaw = "";
        };

        cclub = {
          pskRaw = "";
        };

        meturoam = {
          auth = ''
          ssid="meturoam"
          key_mgmt=WPA-EAP
          pairwise=CCMP
          eap=PEAP
          identity=""
          anonymous_identity="anonymous@metu.edu.tr"
          password=""
          '';      
        };
      
      };
    
    };
  
  };  

}
