{ config, pkgs, lib, home-manager, ... }:

## zenbook laptop specific settings.


{
  imports = [
    home-manager.nixosModules.home-manager
    ../users/memeth/memeth.nix
    ../hardware-configuration.nix
  
  ];


  boot.kernelPackages = pkgs.linuxPackages_latest; 

  # Hardware settings.
  hardware = {
    
    # OpenGL
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
        vaapiVdpau
        libvdpau-va-gl
      ];
    };


    # Firmware
    enableAllFirmware = true;

    # Bluetooth.
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Experimental = true;
          KernelExperimental = true;
        };
      };
    };

    # CPU microcode
    cpu.intel.updateMicrocode = true;

    # Blacklist Nvidia drivers.
    nvidia.modesetting.enable = true;


  };


  # Networking
  networking.hostName = "zenbook";
  networking.networkmanager.enable = true;


  # Use the systemd-boot EFI boot loader.
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = ["nouveau"];
  #boot.kernel.sysctl = {"vm.swappiness" = 5;}; 

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  virtualisation.docker = {

    extraPackages = with pkgs; [
      docker-compose
    ];
  
    rootless = {

      enable = true;
      setSocketVariable = true;
  
    };
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "memeth" ];
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

    # virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.memeth.extraGroups = [ "libvirtd" ];




  # TLP to manage power and performance.
  services.tlp = {
    enable = true;
    settings = {

      WIFI_PWR_ON_AC= "on";
      WIFI_PWR_ON_BAT = "on";

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_BOOST_ON_AC = "1";
      CPU_BOOST_ON_BAT = "0";

      CPU_HWP_DYN_BOOST_ON_AC = "1";
      CPU_HWP_DYN_BOOST_ON_BAT = "0";

      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
    };
  
  };


   swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  } ];

  hardware.i2c.enable = true;
  systemd.services.asus-touchpad-numpad = {
    description = "Activate Numpad inside the touchpad with top right corner switch";
    documentation = ["https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver"];
    path = [ pkgs.i2c-tools ];
    script = ''
      cd ${pkgs.fetchFromGitHub {
        owner = "memeth-my-hawk";
        repo = "asus-touchpad-numpad-driver";
        # These needs to be updated from time to time
        rev = "e0fbd9f025255234d1da7be5cdff729b189fbde0";
        sha256 = "sha256-xNPtB2GFAByna8MBZKJTOCKHGkGB+DhQAp0piVbYynU=";
      }}
      # In the last argument here you choose your layout.
      ${pkgs.python3.withPackages(ps: [ ps.libevdev ])}/bin/python asus_touchpad.py m433ia
    '';
    # Probably needed because it fails on boot seemingly because the driver
    # is not ready yet. Alternativly, you can use `sleep 3` or similar in the
    # `script`.
    serviceConfig = {
      RestartSec = "1s";
      Restart = "on-failure";
    };
    wantedBy = [ "multi-user.target" ];
  };

  
}
