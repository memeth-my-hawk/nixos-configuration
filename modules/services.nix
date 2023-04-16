{ config, pkgs, lib, ... }:

{
  # Services and daemons.
  services = {

    #xserver = {
    #  enable = true;
    #  layout = "tr";
    #};

    # Enable dbus service.
    dbus.enable = true;

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

    # Enable flatpak service.
    flatpak.enable = true;

    # Enable Syncthing service
    syncthing = {
      enable = true;
      user = "memeth";
      dataDir = "/home/memeth";
    };

    # Enable mlocate service
    locate = {
      enable = true;
      locate = pkgs.mlocate;
      interval = "hourly";
      localuser = null;
    };

    # Enable TLP battery saver service
    tlp.enable = true;

    # Disable power-profiles-daemon for TLP if plasma is enabled.
    power-profiles-daemon.enable = false;

    # Enable OpenSSH service
    openssh.enable = true;

  }; # End of services


  # Nix garbage collection service.
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

  };


}
