{ config, lib, pkgs, ... }:

{
  networking.hostName = "asus"; # Define your hostname.
  networking.wireless = {
    enable = true;
    networks = {
      memeth-0 = {
        pskRaw = "";
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
