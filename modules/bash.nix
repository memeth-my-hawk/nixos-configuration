{ config, pkgs, lib, ... }:

{
    # Declare bash aliases.
    programs.bash = {
      
      shellAliases = {
        cl = "clear";
        svim = "sudo vim";
        ping = "ping nixos.org";
        ht = "htop";
        n = "nnn -Hod";
        ll = "ls --color=auto -la";
        up = "cd ..";
        py = "python";
        wttr = "curl wttr.in";
        build = "sudo nixos-rebuild build";
        switch = "sudo nixos-rebuild switch";
        upgrade = "sudo nixos-rebuild switch --upgrade";
        update = "sudo nix-channel --update";
        configure = "sudo vim /etc/nixos/configuration.nix";
        r = "R";
        btt = "bluetoothctl";
        btton = "bluetoothctl power on";
        bttoff = "bluetoothctl power off";
        neo = "neofetch";
        hypr = "dbus-run-session Hyprland -c /etc/nixos/dotfiles/hypr/hyprland.conf";
        swy = "dbus-run-session sway --config /etc/nixos/dotfiles/sway/config";
      };

  };

}
