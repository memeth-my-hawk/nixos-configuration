{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, plasma-manager, ... }: {
    nixosConfigurations = {

      zenbook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs // {systemFlake = self;};
        modules = [ 
          ./devices/zenbook.nix
        ];
      };
 
      
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
        specialArgs = inputs // {systemFlake = self;};
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
