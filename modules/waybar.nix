{ config, pkgs, lib, ... }:

{
  programs.waybar = { 
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
         mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        });
  };

}
