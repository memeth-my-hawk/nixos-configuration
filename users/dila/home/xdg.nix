{ config, lib, pkgs, home-manager, ... }:

{
    xdg = {

    userDirs = {
      enable = true;
      desktop = "$HOME/Masaüstü";
      documents = "$HOME/Belgeler";
      download = "$HOME/İndirilenler";
      music = "$HOME/Belgeler/Müzik";
      pictures = "$HOME/Belgeler/Resimler";
      publicShare = "$HOME/Belgeler/Paylaşım";
      templates = "$HOME/Belgeler/Taslaklar";
      videos = "$HOME/Belgeler/Videolar";

    };
  };

}
