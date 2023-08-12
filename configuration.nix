# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib,  ... }:



{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix # this file is probably not meant to be touched, but i played with it anyway and it was ok. YMMV, proceed with caution.

    ### USERS ###
    ./users/memeth.nix
    #./users/dila.nix
    #./users/aile.nix

    ### DEVICES ###
    ./devices/asus.nix
    #./devices/exper.nix
    #./devices/vaio.nix

    ### MODULES ###
    ./modules/bash.nix # bash aliases and prompt options.
    ./modules/fonts.nix # my selection of fonts
    ./modules/services.nix # various system wide services
    #./modules/hyprland.nix # uncomment to enable Hyprland, a nice wayland compositor.
    #./modules/myHardware.nix # hardware settings such as bluetooth, microcode, printers, etc.
    ./modules/xorg.nix # uncomment to enable xorg.
    #./modules/gnome.nix # uncomment to enable GNOME desktop, requires xorg.nix.
    ./modules/plasma.nix # same as GNOME, but for plasma. having GNOME and Plasma installed at the same time might have weird effects on your system, be careful.
    #./modules/sway.nix # uncomment to enable SwayWM, a wayland compositor that is a drop-in replacement for i3wm.
    ./modules/vim.nix # vim plugins and vimrc options.
    #./modules/wayland.nix # uncomment to enable wayland environment, this module includes pkgs that are made for wayland. useful in sway and hyprland.
    ./modules/virtualisation.nix # settings for virtualisations and VMs, like VirtualBox and virt-manager
    ./modules/packages.nix # system wide packages.
    #./modules/r.nix
    #./modules/python.nix
    ];


}

  
