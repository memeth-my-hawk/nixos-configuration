# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib,  ... }:



{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/bash.nix
    ./modules/fonts.nix
    ./modules/services.nix
    ./modules/hyprland.nix
    ./modules/myHardware.nix
    ./modules/networking.nix
    #./modules/plasma.nix
    ./modules/sway.nix
    ./modules/vim.nix
    ./modules/wayland.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Allow non-free packages
  nixpkgs.config.allowUnfree = true;

  
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


  # List packages installed in system profile.
  environment.systemPackages = 
  
  #### BEGIN Python package declaration ####
  let
    my-python-packages = p: with p; [
      pandas
      seaborn
      matplotlib
      numpy
    ];
  in
  #### END Python package declaration ####

   #### BEGIN R and RStudio with R packages included #### 
   with pkgs;
   let
     R-with-my-packages = rWrapper.override{ packages = with rPackages; [ tidyverse prismatic ]; };
     RStudio-with-my-packages = rstudioWrapper.override{ packages = with rPackages; [ tidyverse prismatic ]; };
   in
   #### END R and RStudio with R packages included ####

    with pkgs; [
    wget
    neofetch
    firefox
    htop
    vlc
    zoom-us
    gcc
    gnumake
    R-with-my-packages
    RStudio-with-my-packages
    julia-bin
    (pkgs.python3.withPackages my-python-packages)
    jupyter
    libreoffice-fresh
    microcodeIntel
    linuxHeaders
    nnn
    signal-desktop
    asciiquarium
    cmatrix
    figlet
    lolcat
    virt-manager
    git
    protonvpn-gui
    mlocate
    element-desktop
    lm_sensors
    smartmontools
    spotdl
    ventoy-bin-full
    dmidecode
    ntfs3g
  ];

  # Enable virtualisation
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;



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

  
