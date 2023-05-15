{ config, pkgs, lib, ... }:

{
   # Hardware settings.
  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;

    cpu.intel.updateMicrocode = true;

    
  };
  
  services.printing.drivers = [ pkgs.hplipWithPlugin pkgs.samsung-unified-linux-driver ];

}
