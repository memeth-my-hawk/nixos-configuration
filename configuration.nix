# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib,  ... }:



{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix # this file is probably not meant to be touched, but i played with it anyway and it was ok. YMMV, proceed with caution.
    ./modules/bash.nix # bash aliases and prompt options.
    ./modules/fonts.nix # my selection of fonts
    ./modules/services.nix # various system wide services
    ./modules/hyprland.nix # uncomment to enable Hyprland, a nice wayland compositor.
    ./modules/myHardware.nix # hardware settings such as bluetooth, microcode, printers, etc.
    ./modules/nvidia.nix # uncomment if you want nvidia drivers. Intel and AMD works fine OOTB anyways.
    ./modules/networking.nix # networking settings,ie. hostname, wifi networks, etc.
    #./modules/xorg.nix # uncomment to enable xorg.
    #./modules/gnome.nix # uncomment to enable GNOME desktop, requires xorg.nix.
    #./modules/plasma.nix # same as GNOME, but for plasma. having GNOME and Plasma installed at the same time might have weird effects on your system, be careful.
    ./modules/sway.nix # uncomment to enable SwayWM, a wayland compositor that is a drop-in replacement for i3wm.
    ./modules/vim.nix # vim plugins and vimrc options.
    ./modules/wayland.nix # uncomment to enable wayland environment, this module includes pkgs that are made for wayland. useful in sway and hyprland.
    ./modules/virtualisation.nix # settings for virtualisations and VMs, like VirtualBox and virt-manager
    ./modules/packages.nix # system wide packages.
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "tr_q-latin5";
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.memeth = {
    isNormalUser = true;
    home = "/home/memeth";
    description = "Mehmet Karaman";
    extraGroups = [ "wheel" "libvirtd" "storage" "mlocate" "video" "docker" "audio" "input" "systemd-journal" ]; # Enable ‘sudo’ for the user.
  };



  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

  
