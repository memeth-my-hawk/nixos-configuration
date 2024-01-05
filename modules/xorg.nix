{ config, pkgs, lib, ... }:

{
  services.xserver.enable = true;
  services.xserver.layout = "tr";

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];


}
