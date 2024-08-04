{ config, pkgs, lib, home-manager, ... }: {

    programs.git = {
      enable = true;
      userName  = "memeth-my-hawk";
      userEmail = "memeth@tutanota.com";
    };


}
