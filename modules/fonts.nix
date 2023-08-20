{ config, pkgs, lib, ... }:

{

  fonts.packages = with pkgs; [
    font-awesome_5
    font-awesome
    source-code-pro
    cantarell-fonts
    corefonts
    carlito
    caladea
  ];

}
