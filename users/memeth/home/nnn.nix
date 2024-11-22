{ config, pkgs, lib, home-manager, ... }: {

  programs.nnn = {
    extraPackages = with pkgs; [ imv ffmpegthumbnailer fontpreview mediainfo ];
    enable = true;
    package = pkgs.nnn.override { withNerdIcons = true; };
    bookmarks = {
      d = "/home/memeth/documents/dersler";
      r = "/run/media/memeth";
    };
    plugins = {
      mappings = {
        m = "nmount";
        k = "kdeconnect";
        s = "suedit";
        i = "imgview";
        b = "boom";
        c = "chksum";
        f = "fixname";
        v = "preview-tui";
      };
      src = "${pkgs.nnn.src}/plugins"; # alternative: ${inputs.nnn}
    };
  };

}
