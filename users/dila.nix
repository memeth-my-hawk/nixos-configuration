{ config, pkgs, lib, ... }:

{

  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Select internationalisation properties.
  i18n.defaultLocale = "tr_TR.UTF-8";
  console = {
    keyMap = "tr_q-latin5";
  };

    # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dila = {
    isNormalUser = true;
    home = "/home/dila";
    description = "Dila Karaman";
    extraGroups = ["wheel" "storage" "mlocate" "video" "audio" "input" "systemd-journal" "networkmanager"]; # Enable ‘sudo’ for the user.
  };

  services.syncthing = {
    enable = true;
    user = "dila";
    dataDir = "/home/dila";

  };


      # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;


}
