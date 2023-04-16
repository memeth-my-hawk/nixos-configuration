{ config, lib, pkgs, ... }:

{
  networking.hostName = "asus"; # Define your hostname.
  networking.wireless = {
    enable = true;
    networks = {
      memeth-0 = {
        pskRaw = "4fa655e68f36d2e7459f08c342ae28586ca095b512471fb94afc608934c981a0";
      };

      meturoam = {
        auth = ''

        ssid="meturoam"
        key_mgmt=WPA-EAP
        pairwise=CCMP
        eap=PEAP
        identity="< username >"
        anonymous_identity="anonymous@metu.edu.tr"
        password="< password >"

        '';
      
      }; 

    };
  };
}
