{ config, pkgs, lib, ... }:

{
  # Services and daemons.
  services = {

    # enable gvfs service for automount and trash stuff
    gvfs.enable = true;
    devmon.enable = true;

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
    };

    # Enable TRIM support for SSDs
    fstrim.enable = true;

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

    # Enable GeoClue service for gammastep
    geoclue2.enable = true;

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

  systemd.extraConfig = ''

    DefaultTimeoutStopSec=10s
  '';

  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
};


}
