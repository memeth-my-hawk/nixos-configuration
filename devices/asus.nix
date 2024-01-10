{ config, pkgs, lib, home-manager, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
    ../users/memeth/memeth.nix
   ../hardware-configuration.nix
  ];
   # Hardware settings.
  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    bluetooth.settings = {
      General = {
        Experimental = true;
        KernelExperimental = true;
      };
    };

    cpu.intel.updateMicrocode = true;
    
    nvidia.modesetting.enable = true;

  };

  hardware.enableAllFirmware = true;

    # Oracle VirtualBox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "memeth" ];

  # virt-manager
  #virtualisation.libvirtd.enable = true;
  #programs.dconf.enable = true;
  #environment.systemPackages = with pkgs; [ virt-manager ];
  #users.users.memeth.extraGroups = [ "libvirtd" ];

  networking.hostName = "asus";
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
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };


}
