{ config, lib, pkgs, ... }:

{
  # Oracle VirtualBox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "memeth" ];

  # virt-manager
  #virtualisation.libvirtd.enable = true;
  #programs.dconf.enable = true;
  #environment.systemPackages = with pkgs; [ virt-manager ];
  #users.users.memeth.extraGroups = [ "libvirtd" ];


}

