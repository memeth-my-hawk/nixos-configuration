{ config, pkgs, lib, ... }:

{

  fonts.packages = with pkgs; [
    corefonts
    carlito
    caladea
    font-awesome_5
    font-awesome
    source-code-pro
    ubuntu_font_family
    nerdfonts
  ];

}
