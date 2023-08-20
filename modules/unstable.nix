{ config, pkgs, lib, ... }:


let
  channel = "nixos-unstable";
  nixexprs = builtins.fetchTarball {
    url = "https://nixos.org/channels/${channel}/nixexprs.tar.xz";
  };
in {
  # Declarative system channel
  # This will download the channel every time you run nixos-rebuild
  nixpkgs.pkgs = import "${nixexprs}" {
    inherit (config.nixpkgs) config overlays localSystem crossSystem;
  };

  # Since we don't want to download the channel every time we use it (e.g.
  # nix-shell), we cache it locally
  nix.nixPath = [
    "nixpkgs=/etc/nixpkgs"
    "nixos-config=/etc/nixos/configuration.nix"
  ];
  environment.etc."nixpkgs".source = "${nixexprs}";


}
