{ config, pkgs, lib, home-manager, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
    ../users/dila/dila.nix
    ../hardware-configuration.nix
  ];
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

    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        mesa
      ];
    };


  };

  services.acpid.enable = true;

  boot.kernel.sysctl = {
    "vm.swappiness" = 20;
  };

  networking.hostName = "vaio";
  networking.networkmanager.enable = true;


  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  boot.kernelParams = [
    "acpi_sleep=nonvs"
  ];

  boot.blacklistedKernelModules = ["nouveau"];


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


      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
    };

  };
}
