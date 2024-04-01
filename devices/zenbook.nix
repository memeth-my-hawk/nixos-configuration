{ config, pkgs, lib, home-manager, ... }:

## zenbook laptop specific settings.


{
  imports = [
    home-manager.nixosModules.home-manager
    ../users/memeth/memeth.nix
    ../hardware-configuration.nix
  
  ];
   

  # Hardware settings.
  hardware = {
    
    # OpenGL
    opengl = {
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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = ["nouveau"];
  boot.kernel.sysctl = {
    "vm.swappiness" = 20;
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  virtualisation.docker.rootless = {

    enable = true;
    setSocketVariable = true;
  
  };

  # TLP to manage power and performance.
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

      WIFI_PWR_ON_AC = "on";
      WIFI_PWR_ON_BAT = "on";

      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      START_CHARGE_THRESH_BAT0 = 50;
      STOP_CHARGE_THRESH_BAT0 = 85;

      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
    };
  
  };



  
}
