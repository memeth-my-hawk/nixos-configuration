{config, pkgs, lib, ... }:

{

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  environment.systemPackages = with pkgs; [

    prismlauncher
    sgt-puzzles
    minetest

    (retroarch.override {
      cores = with libretro; [
        ppsspp
      ];
    })
  ];

}
