{config, pkgs, lib, ...}:

{
  services.syncthing = {
    enable = true;
    user = "memeth";
    dataDir = "/home/memeth";
  };

}
