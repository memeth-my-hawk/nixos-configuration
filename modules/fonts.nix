{ config, pkgs, lib, ... }:

{

  fonts.packages = with pkgs; [
    corefonts
    carlito
    caladea
  ];

}
