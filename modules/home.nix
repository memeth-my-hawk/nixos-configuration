{ pkgs, ...}: {

  home.stateVersion = "23.11";
  programs.nnn = {
    extraPackages = with pkgs; [ sxiv kdeconnect ffmpegthumbnailer fontpreview ];
    enable = true;
    plugins = {
      mappings = {
        D = "nmount";
        K = "kdeconnect";
        y = "suedit";
        H = "imgview";
      };

      src = pkgs.nnn + "/plugins";
    };
  };
}
