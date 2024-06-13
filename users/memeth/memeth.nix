{ config, pkgs, lib, home-manager, systemFlake, ... }:

  
  # R and Python definitions. Moved to devshells/stats, kept here for convenience.
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
    ../../modules/envars.nix
    ../../modules/fonts.nix
    #../../modules/hyprland.nix
    ../../modules/packages.nix
    ../../modules/services.nix
    ../../modules/sway.nix
    ../../modules/vim.nix
    ../../modules/wayland.nix
    ../../modules/gnome.nix
    ../../modules/xorg.nix
    ../../modules/games.nix
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
    packages = with pkgs; [ # memeth specific packages.
      
      #(pkgs.python3.withPackages my-python-packages)
      #R-with-my-packages
      #RStudio-with-my-packages

      signal-desktop
      element-desktop
      #spotdl create a spotdl shell.
      #ventoy-full create a ventoy shell.
      parted
      droidcam
      protonvpn-gui
      zathura
      mpv
      cmus
      joplin-desktop
      vesktop
      openssl
    ];

  };
  

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


  system.stateVersion = "22.11"; # Did you read the comment?

  
}

