{ config, lib, pkgs, home-manager, ... }:

{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 39.9334;
    longitude = 32.8597;
  };

}
