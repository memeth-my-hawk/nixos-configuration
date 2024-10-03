{ config, pkgs, lib, ... }:

{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "tr";

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];


}
