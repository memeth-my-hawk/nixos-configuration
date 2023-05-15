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
          pskRaw = "4fa655e68f36d2e7459f08c342ae28586ca095b512471fb94afc608934c981a0";
        };

        cclub = {
          pskRaw = "d961dfdd98ca88620f71b826e0bf8d92d7fa118ed75b5e65bbfb5f6ed967155c";
        };

        meturoam = {
          auth = ''
          ssid="meturoam"
          key_mgmt=WPA-EAP
          pairwise=CCMP
          eap=PEAP
          identity="@metu.edu.tr"
          anonymous_identity="anonymous@metu.edu.tr"
          password=""
          '';      
        };

        memeth = {
          pskRaw = "87c4f21f18514034a2f9478b37bb2255f950a91e627540b1fbae3835d01a5f03";
        };
      
      };
    
    };
  
  };  

}
