{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      
      acer = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs // {systemFlake = self;};
        modules = [ 
          ./devices/acer.nix
        ];
      };
      
      asus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs // {systemFlake = self;};
        modules = [
          ./devices/asus.nix
        ];
      };

      vaio = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./devices/vaio.nix
        ];
      };

      exper = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./devices/exper.nix
       ];
      };
    };
  };
}
