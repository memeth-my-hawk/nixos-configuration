{ config, pkgs, lib, home-manager, ... }: {

  wayland.windowManager.hyprland = {

    enable = true;
    xwayland.enable = true;

    settings = {

      #"$mod" = "SUPER";


      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      "$mainMod" = "SUPER";
      "$term" = "foot";
      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      "bind" = "$mainMod, Return, exec, $term";

    };
  
  };


}
