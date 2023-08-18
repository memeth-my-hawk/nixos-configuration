{ config, pkgs, lib, ... }:

  let
    my-python-packages = p: with p; [
      pandas
      seaborn
      matplotlib
      numpy
      pillow
    ];
  in

  with pkgs;
  let
    R-with-my-packages = rWrapper.override{ packages = with rPackages; [ tidyverse prismatic quarto ];};
    RStudio-with-my-packages = rstudioWrapper.override{ packages = with rPackages; [ tidyverse prismatic quarto ];};
  in


{

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
      labplot
      gcc
      minetest
      sgtpuzzles
      gnumake
      ktouch
      julia-bin
      jupyter
      nnn
      signal-desktop
      element-desktop
      spotdl
      ventoy-full
      papirus-icon-theme
      arc-theme
      pandoc
      texlive.combined.scheme-small
      parted
      droidcam
      protonvpn-gui
      quarto
    ];


  };

  services.syncthing = {
    enable = true;
    user = "memeth";
    dataDir = "/home/memeth";
  
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

  system.userActivationScripts = {
    copyFiles = {
      text =
        ''
          cp -r /home/memeth/.config/{alacritty,dunst,foot,fuzzel,hypr,kitty,neofetch,htop,sway,waybar,yambar}/ /home/memeth/nixos-configuration/dotfiles/
          cp -r /etc/nixos/modules /home/memeth/nixos-configuration/
          cp -r /etc/nixos/devices /home/memeth/nixos-configuration/
          cp -r /etc/nixos/users /home/memeth/nixos-configuration/
          cp /etc/nixos/configuration.nix /home/memeth/nixos-configuration/
        '';
      };
    };

}

