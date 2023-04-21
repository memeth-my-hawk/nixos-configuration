{ config, lib, pkgs, ... }

{
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true; 
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "memeth" ];
  environment.systemPackages = 
    with pkgs; [
      virt-manager
    ];

}

