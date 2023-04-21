{ config, pkgs, lib, ... }:

{
   # Hardware settings.
  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;

    cpu.intel.updateMicrocode = true;

  };
}
