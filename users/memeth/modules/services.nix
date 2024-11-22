{ config, pkgs, lib, ... }:

{

  # Services and daemons.
  services = {


    # Enable Pipewire service.
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.enable = true;
    };

    # Enable Printing service.
    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin pkgs.samsung-unified-linux-driver ];
    };

    # Enable TRIM support for SSDs
    fstrim.enable = true;

    # Enable mlocate service
    locate = {
      enable = true;
      package = pkgs.mlocate;
      interval = "hourly";
      localuser = null;
    };


    # Enable OpenSSH service
    openssh.enable = true;

    #postgresql = {
    #  enable = true;
    #  ensureDatabases = [ "mydatabase" ];
    #  authentication = pkgs.lib.mkOverride 10 ''
    #     type database  DBuser  auth-method
    #    local all       all     trust
    #  '';
    #};
    
  }; # End of services


  time.hardwareClockInLocalTime = true;



  # Nix garbage collection service.
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };

  };

  systemd.services.NetworkManager-wait-online.enable = false;

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';


}
