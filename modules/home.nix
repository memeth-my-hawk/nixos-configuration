{ pkgs, ...}: {

  #home-manager.nixosModules.home-manager
  #{
  #  home-manager.useGlobalPkgs = true;
  #  home-manager.useUserPackages = true;
  #  home-manager.users.memeth = import ./modules/home.nix;
  #}

  home.stateVersion = "24.05";
  programs.nnn = {
    extraPackages = with pkgs; 
      [ 
        sxiv 
        kdeconnect 
        ffmpegthumbnailer 
        fontpreview 
      ];
    enable = true;
    package = pkgs.nnn.override { withNerdIcons = true; };
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
