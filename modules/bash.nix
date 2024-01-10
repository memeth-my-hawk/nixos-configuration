{ config, pkgs, lib, ... }:

{
    # Declare bash aliases.
    programs.bash = {
      
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
        btt = "bluetoothctl";
        btton = "bluetoothctl power on";
        bttoff = "bluetoothctl power off";
        neo = "neofetch";
        hypr = "dbus-run-session Hyprland";
        swy = "dbus-run-session sway";
        bat = "acpi -V";
        errors = "journalctl -p 3 -b";
      };

      #blesh.enable = true;

      #loginShellInit = "stty erase ^H";
      #shellInit = "stty erase ^H";
      #interactiveShellInit = "stty erase ^H";

  };

}
