{ config, lib, pkgs, ... }:

{

  environment.systemPackages =
  
  let
    my-python-packages = p: with p; [
      pandas
      seaborn
      matplotlib
      numpy
      pillow
    ];
  in

     with pkgs; [
       (pkgs.python3.withPackages my-python-packages)
     ];

}
