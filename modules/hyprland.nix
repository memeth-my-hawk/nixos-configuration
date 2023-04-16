{ config, pkgs, lib, ...}:


{
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
  };


  environment.systemPackages = with pkgs; [
    hyprland-protocols
    hyprpaper
  ];


}
