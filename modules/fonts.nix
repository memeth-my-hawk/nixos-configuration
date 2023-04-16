{ config, pkgs, lib, ... }:

{

  fonts.fonts = with pkgs; [
    font-awesome
    source-code-pro
    cantarell-fonts
    corefonts
  ];

}
