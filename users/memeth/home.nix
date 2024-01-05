{ config, pkgs, lib, home-manager, ... }: {

  programs.nnn = {
    extraPackages = with pkgs; [ imv kdeconnect ffmpegthumbnailer fontpreview ];
    enable = true;
    package = pkgs.nnn.override { withNerdIcons = true; };
    plugins = {
      mappings = {
        t = "nmount";
        K = "kdeconnect";
        y = "suedit";
        i = "imgview";
      };
      src = "${pkgs.nnn.src}/plugins"; # alternative: ${inputs.nnn}
    };
  };

}
