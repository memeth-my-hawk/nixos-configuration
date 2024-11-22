{ lib, config, pkgs, ... }:
{
  programs.konsole = {
    enable = true;
    profiles = {
      memeth = {
        colorScheme = "Arc";
        font = {
          name = "Source Code Pro";
          size = 9;
        };
      };

    };
    defaultProfile = "memeth";
  };


}
