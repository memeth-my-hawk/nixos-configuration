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
    
  }; # End of services


  time.hardwareClockInLocalTime = true;



  # Nix garbage collection service.
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

  };

  systemd.services.NetworkManager-wait-online.enable = false;

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
