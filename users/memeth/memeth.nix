{ config, pkgs, lib, home-manager, systemFlake, ... }:


  let
    my-python-packages = p: with p; [
      pandas
      seaborn
      matplotlib
      numpy
      pillow
      openpyxl
      jupyter
    ];
  in

  with pkgs;
  let
    R-with-my-packages = rWrapper.override{ packages = with rPackages; [ tidyverse prismatic quarto ];};
    RStudio-with-my-packages = rstudioWrapper.override{ packages = with rPackages; [ tidyverse prismatic quarto ];};
  in


{

  imports = [
    ../../modules/bash.nix
    ../../modules/envars.nix
    ../../modules/fonts.nix
    ../../modules/hyprland.nix
    ../../modules/packages.nix
    ../../modules/services.nix
    ../../modules/sway.nix
    ../../modules/vim.nix
    ../../modules/wayland.nix
    ../../modules/wayfire.nix
    ../../modules/gnome.nix
    ../../modules/xorg.nix
    ../../modules/steam.nix
  ];

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
    extraGroups = ["wheel" "storage" "mlocate" "video" "docker" "audio" "input" "systemd-journal" "networkmanager"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      (pkgs.python3.withPackages my-python-packages)
      R-with-my-packages
      RStudio-with-my-packages
      gcc
      sgt-puzzles
      gnumake
      julia-bin
      signal-desktop
      element-desktop
      spotdl
      ventoy-full
      pandoc
      texlive.combined.scheme-small
      parted
      droidcam
      protonvpn-gui
      quarto
      zathura
      mpv
      joplin-desktop
      vesktop
      tesseract
      ocrmypdf
    ];






  home-manager = {
    extraSpecialArgs = {
      inherit systemFlake;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.memeth = lib.mkMerge [
      (
        { config, pkgs, ... }:
        {
          home.stateVersion = "24.05";
          imports = [
            ./home/home.nix
          ];
        }
      )
    ];
  };





  fonts.packages = with pkgs; [
    font-awesome_5
    font-awesome
    source-code-pro
    ubuntu_font_family
    nerdfonts
  ];

  services.syncthing = {
    enable = true;
    user = "memeth";
    dataDir = "/home/memeth";
  
  };




    # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  #system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

  
}

