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
  
  services.printing.drivers = [ pkgs.hplipWithPlugin pkgs.samsung-unified-linux-driver ];
  boot.blacklistedKernelModules = ["nouveau"];
}
