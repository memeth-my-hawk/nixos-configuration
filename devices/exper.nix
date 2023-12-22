{ config, pkgs, lib, ... }:

{
  imports = [
    ../users/aile.nix
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




  };

  networking.hostName = "exper";
  networking.networkmanager.enable = true;


  boot.loader.grub = {
    enable = true;
    device = "";
    useOSProber = true;
  };

  


  boot.blacklistedKernelModules = ["nouveau"];
}
