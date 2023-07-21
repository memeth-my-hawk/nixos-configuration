{ config, pkgs, lib, ... }:

{
  boot.loader.grub = {
    enable = true;
    device = "";
    useOSProber = true;
  };

  time.timeZone = "Europe/Istanbul";

  i18n.defaultLocale = "tr_TR.UTF-8";
  console = {
      keyMap = "tr_q-latin5";
  };

  users.users. = {
    isNormalUser = true;
    home = "/home/";
    description = "";
    extraGroups = ["wheel" "storage" "mlocate" "video" "docker" "audio" "input" "systemd-journal" "networkmanager"]; # Enable ‘sudo’ for the user.
  };


  # Hardware settings.
  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;
    bluetooth.settings = {
      General = {
        Experimental = true;
        KernelExperimental = true;
      };
    };

    cpu.intel.updateMicrocode = true;
    nvidia.modesetting.enable = true;




  };

  boot.blacklistedKernelModules = ["nouveau"];


  # Networking settings
  networking = {
    hostName = ""; # Define your hostname.
    networkmanager.enable = true;
  };

  #programs.nm-applet.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;


  # Enable KDE Plasma
  services.xserver.enable = true;
  services.xserver.layout = "tr";
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;


  programs.partition-manager.enable = true;
  #services.power-profiles-daemon.enable = false;

  # Services and daemons.
  services = {

    # Enable Pipewire service.
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.enable = true;
    };

    # Enable Printing service.
    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin pkgs.samsung-unified-linux-driver ];

    };

    # Enable TRIM support for SSDs
    fstrim.enable = true;

    # Enable Syncthing service
    #syncthing = {
    #  enable = true;
    #  user = "";
    #  dataDir = "";
    #};

    # Enable mlocate service
    locate = {
      enable = true;
      locate = pkgs.mlocate;
      interval = "hourly";
      localuser = null;
    };

  
  };

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  # system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";

  # Nix garbage collection service.
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

  };




  fonts.fonts = with pkgs; [
    source-code-pro
    cantarell-fonts
    corefonts
    carlito
    caladea
  ];


  # Packages and package settings
  nixpkgs.config.allowUnfree = true;
  #services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
      wget
      neofetch
      firefox
      htop
      zoom-us
      gcc
      gnumake
      libreoffice-fresh
      microcodeIntel
      linuxHeaders
      git
      mlocate
      lm_sensors
      smartmontools
      ventoy-full
      dmidecode
      ntfs3g
      acpi
      parted
      android-file-transfer
      droidcam
      usbutils
      zip
      unzip
      shared-mime-info
      mimeo
      #networkmanagerapplet
      tree
      rar
      google-chrome
      vlc
      plasma-pa
      bluedevil
      ark
      polkit-kde-agent
 
  ];


    
 system.copySystemConfiguration = true;


}
