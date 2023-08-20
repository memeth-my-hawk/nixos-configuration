{ config, pkgs, lib, ... }:

{
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

  networking.hostName = "vaio";
  networking.networkmanager.enable = true;


  boot.loader.grub = {
    enable = true;
    device = "";
    useOSProber = true;
  };

  boot.blacklistedKernelModules = ["nouveau"];
}
