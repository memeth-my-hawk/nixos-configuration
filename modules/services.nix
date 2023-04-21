{ config, pkgs, lib, ... }:

{
  # Services and daemons.
  services = {

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

    # Enable OpenSSH service
    openssh.enable = true;
    
    # Enable Music Player Daemon.
    #mpd = {
    #  enable = true;
    #  musicDirectory = "/home/memeth/hdd/memeth/all\ music";
    #  extraConfig = ''
    #    audio_output {
    #    type "pipewire"
    #    name "My PipeWire Output"
    #    }
    #  '';

      # Optional:
      # network.listenAddress = "any"; # if you want to allow non-localhost connections
      # zstartWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
    #};

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
