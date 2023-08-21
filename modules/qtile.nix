{ config, lib, pkgs, ... }:

{

  environment.systemPackages =
  
  let
    my-python-packages = p: with p; [
      qtile
      qtile-extras
    ];
  in

     with pkgs; [
       (pkgs.python3.withPackages my-python-packages)
     ];

}
