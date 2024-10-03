{ config, pkgs, lib, home-manager, ... }:

{
    # Declare bash aliases.
    programs.bash = {

      enable = true;
      
      shellAliases = {
        cl = "clear";
        v = "vim";
        sv = "sudo vim";
        ping = "ping nixos.org";
        ht = "htop";
        n = "nnn -Hod";
        ll = "ls --color=auto -lashX";
        up = "cd ..";
        py = "python";
        wttr = "curl wttr.in";
        build = "sudo nixos-rebuild build";
        switch = "sudo nixos-rebuild switch --flake /etc/nixos#";
        #upgrade = "sudo nixos-rebuild switch --flake /etc/nixos";
        update = "sudo nix flake update /etc/nixos";
        configure = "sudo vim /etc/nixos/configuration.nix";
        r = "R";
        stats-shell = "nix develop $HOME/devshells#stats-shell";
        docs-shell = "nix develop $HOME/devshells#docs-shell";
        py-shell = "nix develop $HOME/devshells#py-shell";
        r-shell = "nix develop $HOME/devshells#r-shell";
        rstudio-shell = "nix develop $HOME/devshells#rstudio-shell";
        julia-shell = "nix develop $HOME/devshells#julia-shell";
        psql-shell = "nix develop $HOME/devshells#psql-shell";
        btt = "bluetoothctl";
        btton = "bluetoothctl power on";
        bttoff = "bluetoothctl power off";
        neo = "neofetch";
        hypr = "dbus-run-session Hyprland";
        swy = "dbus-run-session sway";
        bat = "acpi -V";
        errors = "journalctl -p 3 -b";
      };



  };

}
